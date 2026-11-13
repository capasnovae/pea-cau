# Efectos de sonido sintetizados (sin derechos de terceros): transición, mensaje, tilde, notificación y "congelar".
# Uso: python sfx.py <carpeta>
import os
import sys
import wave

import numpy as np

R = 48000
dir_ = sys.argv[1]
os.makedirs(dir_, exist_ok=True)


def guardar(nombre, x):
    x = np.clip(x / (np.abs(x).max() + 1e-9) * 0.8, -1, 1)
    with wave.open(os.path.join(dir_, nombre + ".wav"), "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(R)
        w.writeframes((x * 32767).astype(np.int16).tobytes())


def t(seg):
    return np.arange(int(R * seg)) / R


rng = np.random.default_rng(3)

# transición: ruido filtrado que sube y baja
s = t(0.55)
ruido = rng.standard_normal(len(s))
env = np.sin(np.pi * s / s[-1]) ** 2
corte = 0.02 + 0.25 * np.sin(np.pi * s / s[-1])
y = np.zeros_like(ruido)
for i in range(1, len(ruido)):
    y[i] = y[i - 1] + corte[i] * (ruido[i] - y[i - 1])
guardar("transicion", y * env)

# mensaje: "pop" corto que baja de tono
s = t(0.12)
f = 900 - 500 * s / s[-1]
guardar("mensaje", np.sin(2 * np.pi * np.cumsum(f) / R) * np.exp(-s * 35))

# tilde: dos notas brillantes
s = t(0.25)
a = np.sin(2 * np.pi * 1320 * s) * np.exp(-s * 18)
b = np.zeros_like(s)
b[int(R * 0.07):] = (np.sin(2 * np.pi * 1760 * s) * np.exp(-s * 16))[: len(s) - int(R * 0.07)]
guardar("tilde", a + b)

# notificación: campanita
s = t(0.7)
guardar("notificacion", (np.sin(2 * np.pi * 1046 * s) + 0.5 * np.sin(2 * np.pi * 1568 * s)) * np.exp(-s * 6))

# congelar: barrido que baja
s = t(0.5)
f = 700 * np.exp(-s * 5) + 80
guardar("congelar", np.sin(2 * np.pi * np.cumsum(f) / R) * np.exp(-s * 4) + 0.3 * rng.standard_normal(len(s)) * np.exp(-s * 10))
