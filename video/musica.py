# Compone la música de fondo del video (piano y cuerdas suaves, estilo institucional) y la toca con FluidSynth.
# Es música original generada acá, sin derechos de terceros. Uso: python musica.py <segundos> <salida.wav>
# Necesita: mido (pip), fluidsynth y el soundfont FluidR3_GM (apt: fluidsynth fluid-soundfont-gm).
import random
import subprocess
import sys

import mido

segundos = float(sys.argv[1])
salida = sys.argv[2]
random.seed(5)

BPM = 76
TPB = 480
COMPAS = TPB * 4
compases = int(segundos / (60 / BPM * 4)) + 2

# Do mayor: I – V – vi – IV, con una vuelta IV – I – ii – V para variar
ACORDES = {
    "C": [48, 55, 64, 67],
    "G": [43, 50, 59, 62],
    "Am": [45, 52, 60, 64],
    "F": [41, 48, 57, 60],
    "Dm": [38, 45, 53, 57],
    "Em": [40, 47, 55, 59],
}
VUELTA_A = ["C", "G", "Am", "F"]
VUELTA_B = ["F", "C", "Dm", "G"]
VUELTA_C = ["Am", "Em", "F", "G"]

mid = mido.MidiFile(ticks_per_beat=TPB)


def pista(programa, canal, volumen):
    t = mido.MidiTrack()
    mid.tracks.append(t)
    t.append(mido.Message("program_change", program=programa, channel=canal, time=0))
    t.append(mido.Message("control_change", control=7, value=volumen, channel=canal, time=0))
    t.append(mido.Message("control_change", control=91, value=90, channel=canal, time=0))  # reverb
    return t


tempo = mido.MidiTrack()
mid.tracks.append(tempo)
tempo.append(mido.MetaMessage("set_tempo", tempo=mido.bpm2tempo(BPM), time=0))

piano = pista(0, 0, 92)
cuerdas = pista(48, 1, 70)
bajo = pista(32, 2, 72)
campana = pista(11, 3, 45)  # vibráfono, para el motivo

eventos = {0: [], 1: [], 2: [], 3: []}


def nota(canal, n, inicio, dur, vel):
    eventos[canal].append((inicio, "on", n, vel))
    eventos[canal].append((inicio + dur, "off", n, 0))


progresion = []
for i in range(compases):
    bloque = (i // 8) % 4
    vuelta = [VUELTA_A, VUELTA_A, VUELTA_B, VUELTA_C][bloque]
    progresion.append(vuelta[i % 4])

for i, ac in enumerate(progresion):
    t0 = i * COMPAS
    notas = ACORDES[ac]
    intro = i < 4
    final = i >= compases - 3
    # piano: arpegio en corcheas, suave
    patron = [0, 1, 2, 3, 2, 1, 2, 3]
    for k, p in enumerate(patron):
        n = notas[p] + 12
        vel = 46 + random.randint(-5, 5) + (8 if k == 0 else 0)
        nota(0, n, t0 + k * TPB // 2, TPB // 2 + 120, vel if not final else max(25, vel - (i - compases + 3) * 10))
    # bajo: fundamental en negras largas
    if not intro:
        nota(2, notas[0] - 12, t0, TPB * 2 - 40, 58)
        nota(2, notas[0] - 12 + (7 if i % 2 else 0), t0 + TPB * 2, TPB * 2 - 40, 50)
    # cuerdas: el acorde entero, sostenido
    if i >= 2:
        for n in notas[1:]:
            nota(1, n + 12, t0, COMPAS - 20, 44)
    # motivo del vibráfono cada 4 compases, a partir del 8
    if i >= 8 and i % 4 == 0 and not final:
        motivo = [notas[2] + 24, notas[3] + 24, notas[2] + 26, notas[3] + 24]
        for k, n in enumerate(motivo):
            nota(3, n, t0 + k * TPB, TPB - 60, 38)

for canal, trk in [(0, piano), (1, cuerdas), (2, bajo), (3, campana)]:
    ev = sorted(eventos[canal], key=lambda e: (e[0], e[1] == "on"))
    ahora = 0
    for (t, tipo, n, vel) in ev:
        trk.append(mido.Message("note_on" if tipo == "on" else "note_off", note=n, velocity=vel, channel=canal, time=t - ahora))
        ahora = t

mid.save(salida + ".mid")
subprocess.run(
    ["fluidsynth", "-ni", "-g", "0.6", "-r", "48000", "-F", salida + ".crudo.wav", "/usr/share/sounds/sf2/FluidR3_GM.sf2", salida + ".mid"],
    check=True,
    stdout=subprocess.DEVNULL,
)
# corta al largo del video con fundido de entrada y salida
subprocess.run(
    ["ffmpeg", "-loglevel", "error", "-y", "-i", salida + ".crudo.wav", "-t", str(segundos),
     "-af", f"afade=t=in:d=2,afade=t=out:st={max(0, segundos - 4)}:d=4,loudnorm=I=-20:TP=-2", "-ar", "48000", salida],
    check=True,
)
