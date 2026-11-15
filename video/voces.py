# Genera las voces del video con Gemini TTS (Google AI Studio, plan gratuito) y mide cuándo se dice cada palabra.
# Uso: python voces.py <pedido.json> <carpeta>. El pedido es una lista de {id, voz, notas, texto}.
# Por cada línea deja <id>.wav y <id>.json (inicio y duración de cada palabra del texto, en segundos).
# Si el audio ya existe no lo vuelve a pedir: el id cambia cuando cambia el texto, la voz o las notas.
#
# La clave: variable GEMINI_API_KEY, o un archivo cuya ruta está en GEMINI_API_KEY_FILE. Nunca va en el repositorio.
# Gemini no devuelve los tiempos de las palabras: los saca Whisper (faster-whisper, modelo "small") escuchando el audio.
# Necesita: pip install faster-whisper numpy.
import base64
import json
import os
import re
import subprocess
import sys
import time
import urllib.error
import urllib.request
import wave

MODELO = os.environ.get("PEA_TTS_MODELO", "gemini-3.8-flash-tts")


def clave():
    if os.environ.get("GEMINI_API_KEY"):
        return os.environ["GEMINI_API_KEY"].strip()
    ruta = os.environ.get("GEMINI_API_KEY_FILE")
    if ruta and os.path.exists(ruta):
        return open(ruta).read().strip()
    sys.exit("Falta la clave de Gemini: GEMINI_API_KEY o GEMINI_API_KEY_FILE")


def pedir_audio(linea, destino):
    # Formato de "notas de dirección": el modelo lee solo lo que va debajo de TRANSCRIPCIÓN
    prompt = f"### NOTAS DE DIRECCIÓN\n{linea['notas']}\n\n#### TRANSCRIPCIÓN\n{linea['texto']}"
    cuerpo = {
        "contents": [{"parts": [{"text": prompt}]}],
        "generationConfig": {
            "responseModalities": ["AUDIO"],
            "speechConfig": {"voiceConfig": {"prebuiltVoiceConfig": {"voiceName": linea["voz"]}}},
        },
    }
    pedido = urllib.request.Request(
        f"https://generativelanguage.googleapis.com/v1beta/models/{MODELO}:generateContent",
        data=json.dumps(cuerpo).encode(),
        headers={"Content-Type": "application/json", "x-goog-api-key": clave()},
    )
    for intento in range(12):
        try:
            r = json.load(urllib.request.urlopen(pedido, timeout=180))
            pcm = base64.b64decode(r["candidates"][0]["content"]["parts"][0]["inlineData"]["data"])
            break
        except (urllib.error.HTTPError, KeyError, IndexError) as e:
            # el plan gratis limita los pedidos por minuto: se espera y se reintenta
            espera = 20 + intento * 10
            print(f"  {linea['id']}: {getattr(e, 'code', e)}, reintento en {espera} s", file=sys.stderr)
            time.sleep(espera)
    else:
        raise SystemExit(f"No se pudo generar {linea['id']}")
    with wave.open(destino, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(24000)
        w.writeframes(pcm)


_whisper = None


def tiempos(wav, texto):
    """Momento de cada palabra del texto: Whisper da las palabras que oye y se reparten sobre las del guion."""
    global _whisper
    import numpy as np
    from faster_whisper import WhisperModel

    if _whisper is None:
        _whisper = WhisperModel("small", device="cpu", compute_type="int8")
    crudo = subprocess.run(["ffmpeg", "-loglevel", "error", "-i", wav, "-f", "s16le", "-ac", "1", "-ar", "16000", "-"], capture_output=True).stdout
    segs, _ = _whisper.transcribe(np.frombuffer(crudo, np.int16).astype(np.float32) / 32768, language="es", word_timestamps=True)
    oidas = [w for s in segs for w in s.words]
    guion = [p for p in texto.split() if re.search(r"\w", p)]
    if not oidas or not guion:
        return []
    # alineación simple: la palabra i del guion toma el tiempo de la palabra proporcional que oyó Whisper
    salida = []
    for i, p in enumerate(guion):
        w = oidas[min(len(oidas) - 1, round(i * (len(oidas) - 1) / max(1, len(guion) - 1)))]
        salida.append({"t": round(w.start, 3), "d": round(max(0.08, w.end - w.start), 3), "p": p})
    # que los tiempos nunca vayan para atrás
    for a, b in zip(salida, salida[1:]):
        if b["t"] < a["t"]:
            b["t"] = a["t"]
    return salida


def main():
    pedido = json.load(open(sys.argv[1], encoding="utf8"))
    carpeta = sys.argv[2]
    os.makedirs(carpeta, exist_ok=True)
    for linea in pedido:
        wav = os.path.join(carpeta, linea["id"] + ".wav")
        meta = os.path.join(carpeta, linea["id"] + ".json")
        if os.path.exists(wav) and os.path.exists(meta):
            continue
        print(f"Voz {linea['id']} ({linea['voz']}): {linea['texto'][:50]}…")
        if not os.path.exists(wav):
            pedir_audio(linea, wav + ".tmp")
            os.replace(wav + ".tmp", wav)
            time.sleep(4)
        json.dump(tiempos(wav, linea["texto"]), open(meta, "w", encoding="utf8"), ensure_ascii=False)


main()
