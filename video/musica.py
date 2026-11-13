# Compone la música de fondo del video y la toca con FluidSynth. Es música original generada acá, sin derechos de terceros.
# Dos estilos: "suave" (piano y cuerdas, institucional) y "lofi" (piano eléctrico, acordes de jazz, batería tranquila
# con swing y ruido de vinilo). Uso: python musica.py <segundos> <salida.wav> [suave|lofi]
# Necesita: mido (pip), fluidsynth y el soundfont FluidR3_GM (apt: fluidsynth fluid-soundfont-gm).
import random
import subprocess
import sys

import mido

segundos = float(sys.argv[1])
salida = sys.argv[2]
estilo = sys.argv[3] if len(sys.argv) > 3 else "suave"
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

def componer_lofi():
    """Lo-fi: Rhodes con acordes de séptima y novena, bajo redondo, batería con swing y algún adorno de vibráfono."""
    bpm = 74
    tpb = 480
    compas = tpb * 4
    total = int(segundos / (60 / bpm * 4)) + 2
    m = mido.MidiFile(ticks_per_beat=tpb)
    tem = mido.MidiTrack()
    m.tracks.append(tem)
    tem.append(mido.MetaMessage("set_tempo", tempo=mido.bpm2tempo(bpm), time=0))
    # ii9 – V13 – Imaj9 – vi9 en Fa, y una vuelta IVmaj7 – iii7 – ii9 – V7
    acordes = {
        "Gm9": [43, 58, 62, 65, 69],
        "C13": [36, 58, 64, 69, 62],
        "Fmaj9": [41, 57, 60, 64, 67],
        "Dm9": [38, 53, 57, 60, 64],
        "Bbmaj7": [46, 57, 62, 65, 69],
        "Am7": [45, 55, 60, 64, 67],
        "C7": [36, 58, 64, 67, 70],
    }
    vueltas = [["Gm9", "C13", "Fmaj9", "Dm9"], ["Bbmaj7", "Am7", "Gm9", "C7"]]
    ev = {0: [], 1: [], 2: [], 9: []}

    def n(c, nota_, ini, dur, vel):
        ev[c].append((int(ini), "on", nota_, vel))
        ev[c].append((int(ini + dur), "off", nota_, 0))

    swing = tpb // 6  # corcheas con swing
    for i in range(total):
        nombre = vueltas[(i // 8) % 2][i % 4]
        ac = acordes[nombre]
        t0 = i * compas
        intro = i < 2
        final = i >= total - 2
        # Rhodes: acorde en el 1 (arpegiado apenas) y un golpe anticipado en el "y" del 2
        for k, nota_ in enumerate(ac[1:]):
            n(0, nota_, t0 + k * 18, tpb * 2 - 60, 50 + random.randint(-6, 6))
        for k, nota_ in enumerate(ac[2:]):
            n(0, nota_, t0 + tpb * 2 + tpb // 2 + swing + k * 15, tpb + tpb // 2, 40 + random.randint(-5, 5))
        # bajo
        if not intro:
            n(1, ac[0] - 12 if ac[0] > 40 else ac[0], t0, tpb + tpb // 2, 64)
            n(1, ac[0] - 12 + 7 if ac[0] > 40 else ac[0] + 7, t0 + tpb * 2 + tpb // 2 + swing, tpb, 54)
        # batería: bombo, aro y hi-hat con swing
        if not intro and not final:
            for b in range(4):
                tb = t0 + b * tpb
                if b in (0,) or (b == 2 and i % 2):
                    n(9, 36, tb, 120, 70)
                if b == 2 and i % 2 == 0:
                    n(9, 36, tb + tpb // 2 + swing, 120, 55)
                if b in (1, 3):
                    n(9, 37, tb, 120, 58)
                n(9, 42, tb, 80, 38 + random.randint(-6, 6))
                n(9, 42, tb + tpb // 2 + swing, 80, 26 + random.randint(-6, 6))
        # adorno de vibráfono cada 8 compases
        if i % 8 == 4 and not final:
            for k, nota_ in enumerate([ac[3] + 12, ac[4] + 12, ac[2] + 12]):
                n(2, nota_, t0 + k * (tpb // 2 + swing), tpb, 34)
    for canal, prog, vol in [(0, 4, 96), (1, 33, 82), (2, 11, 50), (9, 0, 70)]:
        trk = mido.MidiTrack()
        m.tracks.append(trk)
        if canal != 9:
            trk.append(mido.Message("program_change", program=prog, channel=canal, time=0))
        trk.append(mido.Message("control_change", control=7, value=vol, channel=canal, time=0))
        trk.append(mido.Message("control_change", control=91, value=70, channel=canal, time=0))
        ahora = 0
        for (t, tipo, nota_, vel) in sorted(ev[canal], key=lambda e: (e[0], e[1] == "on")):
            trk.append(mido.Message("note_on" if tipo == "on" else "note_off", note=nota_, velocity=vel, channel=canal, time=t - ahora))
            ahora = t
    return m


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

if estilo == "lofi":
    mid = componer_lofi()

mid.save(salida + ".mid")
subprocess.run(
    ["fluidsynth", "-ni", "-g", "0.6", "-r", "48000", "-F", salida + ".crudo.wav", "/usr/share/sounds/sf2/FluidR3_GM.sf2", salida + ".mid"],
    check=True,
    stdout=subprocess.DEVNULL,
)
# corta al largo del video con fundido de entrada y salida
fundidos = f"afade=t=in:d=2,afade=t=out:st={max(0, segundos - 4)}:d=4,loudnorm=I=-20:TP=-2"
if estilo == "lofi":
    # sonido gastado: sin agudos, apenas saturado, con ruido de vinilo de fondo
    subprocess.run(
        ["ffmpeg", "-loglevel", "error", "-y", "-i", salida + ".crudo.wav",
         "-f", "lavfi", "-i", f"anoisesrc=color=brown:amplitude=0.012:duration={segundos + 1},highpass=f=400,lowpass=f=5000",
         "-filter_complex",
         f"[0:a]lowpass=f=3800,highpass=f=40,acompressor=threshold=0.2:ratio=3,volume=1.3[m];[m][1:a]amix=inputs=2:normalize=0,{fundidos}",
         "-t", str(segundos), "-ar", "48000", salida],
        check=True,
    )
else:
    subprocess.run(
        ["ffmpeg", "-loglevel", "error", "-y", "-i", salida + ".crudo.wav", "-t", str(segundos), "-af", fundidos, "-ar", "48000", salida],
        check=True,
    )
