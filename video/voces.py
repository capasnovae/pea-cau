# Genera las voces del video con Gemini TTS (Google AI Studio, plan gratuito) y mide cuándo se dice cada palabra.
# Uso: python voces.py <pedido.json> <carpeta>. El pedido es una lista de {id, voz, notas, texto}.
# Por cada línea deja <id>.wav y <id>.json (inicio y duración de cada palabra del texto, en segundos).
#
# El plan gratis permite pocos pedidos por día (10 por modelo), así que se pide UN audio por personaje con todas sus
# frases juntas, y después se corta frase por frase: Whisper (faster-whisper) escucha el audio, se alinean sus palabras
# con las del guion y se corta en el silencio entre una frase y la siguiente. Si un modelo llegó al límite del día,
# se prueba con el siguiente de la lista.
#
# La clave: variable GEMINI_API_KEY, o un archivo cuya ruta está en GEMINI_API_KEY_FILE. Nunca va en el repositorio.
# Necesita: pip install faster-whisper numpy; y ffmpeg.
import base64
import difflib
import json
import os
import re
import subprocess
import sys
import time
import unicodedata
import urllib.error
import urllib.request
import wave

MODELOS = os.environ.get("PEA_TTS_MODELOS", "gemini-3.8-flash-tts,gemini-3.1-flash-tts-preview,gemini-2.5-flash-preview-tts,gemini-3.8-flash-lite-tts").split(",")
R = 24000


def clave():
    if os.environ.get("GEMINI_API_KEY"):
        return os.environ["GEMINI_API_KEY"].strip()
    ruta = os.environ.get("GEMINI_API_KEY_FILE")
    if ruta and os.path.exists(ruta):
        return open(ruta).read().strip()
    sys.exit("Falta la clave de Gemini: GEMINI_API_KEY o GEMINI_API_KEY_FILE")


def pedir_audio(voz, notas, texto):
    """Devuelve el audio PCM (24 kHz, 16 bits, mono) del texto, probando los modelos en orden."""
    prompt = f"### NOTAS DE DIRECCIÓN\n{notas} Entre un párrafo y otro, hacé una pausa breve.\n\n#### TRANSCRIPCIÓN\n{texto}"
    cuerpo = json.dumps({
        "contents": [{"parts": [{"text": prompt}]}],
        "generationConfig": {"responseModalities": ["AUDIO"], "speechConfig": {"voiceConfig": {"prebuiltVoiceConfig": {"voiceName": voz}}}},
    }).encode()
    for modelo in MODELOS:
        for intento in range(4):
            pedido = urllib.request.Request(
                f"https://generativelanguage.googleapis.com/v1beta/models/{modelo}:generateContent",
                data=cuerpo, headers={"Content-Type": "application/json", "x-goog-api-key": clave()})
            try:
                r = json.load(urllib.request.urlopen(pedido, timeout=600))
                print(f"  audio de {voz} con {modelo}")
                return base64.b64decode(r["candidates"][0]["content"]["parts"][0]["inlineData"]["data"])
            except urllib.error.HTTPError as e:
                detalle = e.read().decode(errors="ignore")
                if e.code == 429 and "PerDay" in detalle:
                    print(f"  {modelo}: se terminó el cupo del día, pruebo otro modelo", file=sys.stderr)
                    break
                espera = 30 * (intento + 1)
                print(f"  {modelo}: error {e.code}, reintento en {espera} s", file=sys.stderr)
                time.sleep(espera)
            except (KeyError, IndexError):
                print(f"  {modelo}: respuesta sin audio, reintento", file=sys.stderr)
                time.sleep(10)
    raise SystemExit("Ningún modelo pudo generar el audio (¿se terminó el cupo del día en todos?)")


_whisper = None


def palabras_oidas(pcm):
    global _whisper
    import numpy as np
    from faster_whisper import WhisperModel

    if _whisper is None:
        _whisper = WhisperModel("small", device="cpu", compute_type="int8")
    x = np.frombuffer(pcm, np.int16).astype(np.float32) / 32768
    x16 = np.interp(np.arange(0, len(x), R / 16000), np.arange(len(x)), x).astype(np.float32)
    segs, _ = _whisper.transcribe(x16, language="es", word_timestamps=True)
    return [(w.word, w.start, w.end) for s in segs for w in s.words]


def normal(p):
    p = unicodedata.normalize("NFD", p.lower())
    return re.sub(r"[^a-z0-9ñ]", "", "".join(c for c in p if unicodedata.category(c) != "Mn"))


def cortar(pcm, lineas, oidas):
    """Reparte el audio largo entre las líneas: alinea palabras del guion con las oídas y corta entre frases."""
    guion = []  # (línea, palabra)
    for i, l in enumerate(lineas):
        for p in l["texto"].split():
            if re.search(r"\w", p):
                guion.append((i, p))
    a = [normal(p) for _, p in guion]
    b = [normal(w) for w, _, _ in oidas]
    tiempo = [None] * len(guion)
    for bloque in difflib.SequenceMatcher(None, a, b, autojunk=False).get_matching_blocks():
        for k in range(bloque.size):
            tiempo[bloque.a + k] = oidas[bloque.b + k][1:]
    # las palabras sin pareja toman el tiempo interpolado entre vecinas
    conocidos = [k for k, t in enumerate(tiempo) if t]
    for k in range(len(tiempo)):
        if tiempo[k] is None:
            ant = max([c for c in conocidos if c < k], default=None)
            sig = min([c for c in conocidos if c > k], default=None)
            if ant is not None and sig is not None:
                f = (k - ant) / (sig - ant)
                t = tiempo[ant][1] + f * (tiempo[sig][0] - tiempo[ant][1])
            elif ant is not None:
                t = tiempo[ant][1]
            else:
                t = tiempo[sig][0] if sig is not None else 0
            tiempo[k] = (t, t + 0.2)
    total = len(pcm) / 2 / R
    # cortes: a mitad del silencio entre la última palabra de una línea y la primera de la siguiente
    limites = []
    for i in range(len(lineas)):
        ks = [k for k, (li, _) in enumerate(guion) if li == i]
        limites.append((tiempo[ks[0]][0], tiempo[ks[-1]][1], ks))
    resultado = []
    for i, (ini, fin, ks) in enumerate(limites):
        desde = 0 if i == 0 else (limites[i - 1][1] + ini) / 2
        hasta = total if i == len(limites) - 1 else (fin + limites[i + 1][0]) / 2
        desde = max(0, min(desde, ini - 0.05))
        trozo = pcm[int(desde * R) * 2 : int(hasta * R) * 2]
        pal = [{"t": round(tiempo[k][0] - desde, 3), "d": round(max(0.08, tiempo[k][1] - tiempo[k][0]), 3), "p": guion[k][1]} for k in ks]
        resultado.append((trozo, pal))
    return resultado


def guardar_wav(ruta, pcm):
    with wave.open(ruta, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(R)
        w.writeframes(pcm)


def main():
    pedido = json.load(open(sys.argv[1], encoding="utf8"))
    carpeta = sys.argv[2]
    os.makedirs(carpeta, exist_ok=True)
    falta = lambda l: not (os.path.exists(os.path.join(carpeta, l["id"] + ".wav")) and os.path.exists(os.path.join(carpeta, l["id"] + ".json")))
    grupos = {}
    for l in pedido:
        if falta(l):
            grupos.setdefault((l["voz"], l["notas"]), []).append(l)
    for (voz, notas), lineas in grupos.items():
        # sin repetidos, en el orden del guion
        vistas, unicas = set(), []
        for l in lineas:
            if l["id"] not in vistas:
                vistas.add(l["id"])
                unicas.append(l)
        print(f"Voz {voz}: {len(unicas)} frases en un solo audio")
        pcm = pedir_audio(voz, notas, "\n\n".join(l["texto"] for l in unicas))
        guardar_wav(os.path.join(carpeta, f"crudo-{voz}.wav"), pcm)
        for l, (trozo, pal) in zip(unicas, cortar(pcm, unicas, palabras_oidas(pcm))):
            guardar_wav(os.path.join(carpeta, l["id"] + ".wav"), trozo)
            json.dump(pal, open(os.path.join(carpeta, l["id"] + ".json"), "w", encoding="utf8"), ensure_ascii=False)


main()
