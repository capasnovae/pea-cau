# Genera las voces del video con las voces neuronales de Microsoft (servicio de lectura en voz alta de Edge, sin cuenta).
# Uso: python voces.py <pedido.json> <carpeta>. El pedido es una lista de {id, voz, texto, velocidad}.
# Por cada línea deja <id>.mp3 y <id>.json (en qué momento se dice cada palabra, en segundos).
# Si el audio ya existe no lo vuelve a pedir: el id cambia cuando cambia el texto o la voz.
import asyncio
import json
import os
import sys

import edge_tts


async def una(linea, carpeta):
    mp3 = os.path.join(carpeta, linea["id"] + ".mp3")
    meta = os.path.join(carpeta, linea["id"] + ".json")
    if os.path.exists(mp3) and os.path.exists(meta):
        return
    com = edge_tts.Communicate(
        linea["texto"],
        linea["voz"],
        rate=linea.get("velocidad", "+0%"),
        boundary="WordBoundary",
        proxy=os.environ.get("HTTPS_PROXY"),
    )
    palabras = []
    with open(mp3 + ".tmp", "wb") as f:
        async for parte in com.stream():
            if parte["type"] == "audio":
                f.write(parte["data"])
            elif parte["type"] == "WordBoundary":
                palabras.append({"t": parte["offset"] / 1e7, "d": parte["duration"] / 1e7, "p": parte["text"]})
    os.replace(mp3 + ".tmp", mp3)
    with open(meta, "w", encoding="utf8") as f:
        json.dump(palabras, f, ensure_ascii=False)


async def main():
    pedido = json.load(open(sys.argv[1], encoding="utf8"))
    carpeta = sys.argv[2]
    os.makedirs(carpeta, exist_ok=True)
    for linea in pedido:
        for intento in range(4):
            try:
                await una(linea, carpeta)
                break
            except Exception as e:  # el servicio corta a veces: se reintenta
                if intento == 3:
                    raise
                print(f"Reintento {linea['id']}: {e}", file=sys.stderr)
                await asyncio.sleep(2 * (intento + 1))


asyncio.run(main())
