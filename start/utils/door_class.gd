# Definizione della classe "Door", che eredita da AnimatedSprite2D
class_name Door
extends AnimatedSprite2D

signal door_opened # Definizione di un segnale "door_opened"

const OPEN_KEY = "open" # Definizione di una costante per la chiave dell'animazione di apertura

# Funzione _ready(), chiamata quando il nodo è pronto
func _ready():
	# Connessione del segnale "animation_finished" alla funzione "door_open_animation_finished"
	animation_finished.connect(door_open_animation_finished)

# Funzione per aprire la porta, avviando l'animazione "open"
func open():
	play(OPEN_KEY)

# Funzione chiamata al termine di un'animazione
func door_open_animation_finished():
	# Verifica se l'animazione terminata è quella di apertura ("open")
	if animation == OPEN_KEY:
		# Se l'animazione è quella di apertura, emette il segnale "door_opened"
		emit_signal("door_opened")
