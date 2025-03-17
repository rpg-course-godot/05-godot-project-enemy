class_name Projectile
extends Node2D

@export var animated_sprite_2D: AnimatedSprite2D # definiamo una variabile di export per il nodo AnimatedSprite2D
@export var visible_on_screen_notitifier_2D: VisibleOnScreenNotifier2D # definiamo una variabile di export per il nodo VisibleOnScreenNotifier2D

@export var SPEED: int = 200 # definiamo una variabile di export per la velocità del proiettile
const START_ANIMATION_KEY = "start" # definiamo una costante per la chiave dell'animazione 'start' del nostro proiettile

func _ready():
	animated_sprite_2D.play(START_ANIMATION_KEY) # facciamo partire l'animazione 'start' del nostro proiettile
	
	visible_on_screen_notitifier_2D.screen_exited.connect(queue_free) # quando il proiettile esce dallo schermo viene distrutto

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation) # calcoliamo la direzione che deve avere il proiettile
	global_position += SPEED * direction * delta # muoviamo il proiettile
