class_name Mob # definiamo lo script come una classe globalmente accessibile con il nome 'Mob'
extends CharacterBody2D # estendiamo la classe CharacterBody2D (e quindi ne ereditiamo metodi e proprietà)

@export var ACCELERATION = 300 # definiamo una variabile che rappresenta l'accelerazione che ha il nostro mob quando ha iniziato a muoversi
@export var MAX_SPEED = 50 # definiamo una variabile che rappresenta la velocità massima a cui potrà muoversi il mob
@export var FRICTION = 200 # definiamo una variabile che rappresenta la decelerazione che ha il mob quando si sta sta fermando (questo evita che il mob si fermi bruscamente dopo che ha smesso di muoversi)
@export var WANDER_TARGET_RANGE = 4 # definiamo una variabile che rappresenta il raggio massimo che può avere la zona in cui il mob si muove quando è nello stato "wander"

@export var MIN_DISTANCE_FROM_PLAYER = 10 # definiamo una variabile che rappresenta la distanza minima che deve avere il mob rispetto al player quando questo entra nella PlayerDetectionZone

# definiamo un tipo enumerativo per gli stati del nostro mob
enum States {
	IDLE,
	WANDER
}
