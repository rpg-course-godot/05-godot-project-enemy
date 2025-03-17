class_name Player # Definisce lo script come una classe globalmente accessibile con il nome 'Player'
extends CharacterBody2D

const MAX_DEFAULT_SPEED = 150 # definiamo una costante che rappresenta la nostra velocità massima

@export var SPEED = MAX_DEFAULT_SPEED # definiamo una variabile per impostare la velocità del personaggio

@onready var animation_player = $AnimationPlayer # reference al nodo AnimationPlayer
@onready var animation_tree = $AnimationTree # reference al nodo AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback") # reference allo stato corrente dell'AnimationTree

const IDLE_ANIMATION_KEY = "Idle" # chiave con cui abbiamo chiamato lo stato di idle nell'AnimationTree
const WALK_ANIMATION_KEY = "Walk" # chiave con cui abbiamo chiamato lo stato di walk nell'AnimationTree
const BASE_ATTACK_LEFT_HAND_ANIMATION_KEY = "BaseAttackLeftHand" # chiave con cui abbiamo chiamato lo stato di BaseAttackLeftHand nell'AnimationTree
const BASE_ATTACK_RIGHT_HAND_ANIMATION_KEY = "BaseAttackRightHand" # chiave con cui abbiamo chiamato lo stato di BaseAttackRightHand nell'AnimationTree

const AURA_BOOM_DISTANCE_FROM_PLAYER = 20 # definiamo una costante che rappresenta la distanza che il proiettile YuiAuraBoom deve avere dal giocatore quando viene creato

var player_direction: Vector2 = Vector2.DOWN # definiamo una variabile che tiene in memoria la direzione guardata dal player in ogni istante
var is_was_last_base_attack_done_with_rigth_hand = false # memorizziamo se l'ultimo attacco è stato fatto con la mano destra in modo tale da poter attaccare utilizzando in maniera alternato una mano o l'altra

const YuiAuraBoom = preload("res://projectiles/yui_aura_boom.tscn") # precarichiamo il nodo YuiAuraBoom

# vettore che contiene tutte le blend position, ovvero i crosshair degli stati dell'AnimationTree
# ricordiamo che la sprite cambia a seconda della posizione del crosshair nello spazio
const ANIMATION_TREE_PARAMETERS = [
	"parameters/Idle/blend_position",
	"parameters/Walk/blend_position",
	"parameters/BaseAttackLeftHand/blend_position",
	"parameters/BaseAttackRightHand/blend_position"
]

# definiamo un tipo enumerativo per gli stati del nostro player
enum States {
	WALK,
	BASE_ATTACK
}

# definiamo una variabile che tiene traccia dello stato corrente in cui si trova il nostro player
var state: States = States.WALK

# definiamo una variabile che definisce se il player si trova in cutscene oppure no
var is_player_in_cutscene: bool = false

func _ready():
	animation_tree.active = true # abilitiamo il nodo AnimationTree

func _physics_process(_delta):
	# possiamo eseguire gli azioni dello stato in cui ci troviamo solamente se il player non è in cutscene
	if not is_player_in_cutscene:
		# eseguiamo un'azione specifica in base allo stato in cui si trova il nostro player
		match state:
			States.WALK: # il player sta camminando o è fermo
				walk_state()
			States.BASE_ATTACK: # il player sta attaccando con l'attacco base
				pass

# funzione che gestisce le operazioni dello stato WALK del nostro player
func walk_state():
	var input_vector = Vector2.ZERO # impostiamo a ZERO il valore iniziale del nostro vettore di movimento
	
	var current_player_direction: Vector2 = Vector2.ZERO # impostiamo a ZERO il valore iniziale del nostro vettore che indica la direzione "guardata" dal player
	
	# calcoliamo in che direzione il giocatore vuole fare muovere il personaggio
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# normalizziamo il vettore per ottenere una direzione
	input_vector = input_vector.normalized()
	current_player_direction = input_vector # il player sta guardando la stessa direzione in cui si sta muovendo
	
	if input_vector != Vector2.ZERO: # controlliamo che il giocatore sta effettivamente muovendo il personaggio
		player_direction = current_player_direction
		face_direction(current_player_direction) # facciamo guardare al player la direzione che deve guardare mentre si sta muovendo
		animation_state.travel(WALK_ANIMATION_KEY) # passiamo dallo stato "Idle" allo stato "Walk"
		
		velocity = velocity.move_toward(input_vector * SPEED, SPEED) # se il giocatore sta effettivamente muovendo il personaggio, assegniamo una velocità a quest'ultimo
	else:
		animation_state.travel(IDLE_ANIMATION_KEY) # passiamo dallo stato "Walk" allo stato "Idle"
		
		velocity = Vector2.ZERO # se il giocatore NON sta effettivamente muovendo il personaggio, assegniamo una velocità NULLA a quest'ultimo

	move_and_slide() # muoviamo il personaggio sullo schermo
	
	if Input.is_action_just_pressed("base_attack"): # controlliamo se l'utente ha cliccato il tasto per attaccare
		state = States.BASE_ATTACK # cambiamo stato
		base_attack()

func face_direction(direction: Vector2) -> void:
	for parameter in ANIMATION_TREE_PARAMETERS: # cicliamo ogni crosshair degli stati dell'AnimationTree
		animation_tree.set(parameter, direction) # posizioniamo il crosshair di ogni stato dell'AnimationTree nella direzione indicata

# gestisce il comportamento del player per l'attacco base
func base_attack():
	velocity = Vector2.ZERO # fermiamo il player
	
	# controlliamo con che mano ha attaccato l'ultima volta
	if is_was_last_base_attack_done_with_rigth_hand:
		animation_state.travel(BASE_ATTACK_LEFT_HAND_ANIMATION_KEY) # riproduciamo l'animazione di attacco con la mano sinistra
		is_was_last_base_attack_done_with_rigth_hand = false # ci ricordiamo che l'ultima volta abbiamo attaccato con la mano sinistra
	else:
		animation_state.travel(BASE_ATTACK_RIGHT_HAND_ANIMATION_KEY) # riproduciamo l'animazione di attacco con la mano destra
		is_was_last_base_attack_done_with_rigth_hand = true # ci ricordiamo che l'ultima volta abbiamo attaccato con la mano destra
	
	if YuiAuraBoom: # controlliamo se effettivamente il nodo YuiAuraBoom esiste e quindi è stato precaricato con successo
		var yui_aura_boom = YuiAuraBoom.instantiate() # istanziamo un nuovo nodo della classe YuiAuraBoom
		get_tree().current_scene.add_child(yui_aura_boom) # aggiungiamo il proiettile YuiAuraBoom alla nostra scena
		yui_aura_boom.global_position = self.global_position # impostiamo la posizione del proiettile per essere la stessa del player
		var yui_aura_boom_rotation = deg_to_rad(0) # definiamo una variabile temporanea per memorizzare la rotazione del proiettile
		match player_direction: # controlliamo in che direzione sta attualmente guardando il player
			Vector2.UP:
				yui_aura_boom.global_position -= Vector2(0, AURA_BOOM_DISTANCE_FROM_PLAYER) # distanziamo il proiettile dal player
				yui_aura_boom_rotation = deg_to_rad(270) # impostiamo la rotazione del proiettile
			Vector2.DOWN:
				yui_aura_boom.global_position += Vector2(0, AURA_BOOM_DISTANCE_FROM_PLAYER)
				yui_aura_boom_rotation = deg_to_rad(90)
			Vector2.LEFT:
				yui_aura_boom.global_position -= Vector2(AURA_BOOM_DISTANCE_FROM_PLAYER, 0)
				yui_aura_boom_rotation = deg_to_rad(180)
			Vector2.RIGHT:
				yui_aura_boom.global_position += Vector2(AURA_BOOM_DISTANCE_FROM_PLAYER, 0)
				yui_aura_boom_rotation = deg_to_rad(360)
		yui_aura_boom.rotation = yui_aura_boom_rotation # ruotiamo il proiettile

func base_attack_animation_finished():
	state = States.WALK

func enter_room():
	set_player_as_not_in_cutscene()

func exit_room():
	set_player_as_in_cutscene()

func set_player_as_in_cutscene():
	velocity = Vector2.ZERO
	animation_state.travel(IDLE_ANIMATION_KEY)
	is_player_in_cutscene = true

func set_player_as_not_in_cutscene():
	is_player_in_cutscene = false
	state = States.WALK
