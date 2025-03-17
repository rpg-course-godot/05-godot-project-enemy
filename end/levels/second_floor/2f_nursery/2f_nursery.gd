extends Node2D # estendiamo dalla classe Node2D

@onready var game_camera = $GameCamera # salviamo il riferimento al nodo GameCamera della scena
@onready var player = $Player # salviamo il riferimento al nodo player della scena
@onready var scene_transition = $Transitions/SceneTransition # salviamo il riferimento del nodo SceneTransition

var scene_changer_controller = SceneChangerController # otteniamo il riferimento allo script autoload SceneChangerController

func _ready():
	scene_changer_controller.set_up_room(game_camera, player, scene_transition) # prepariamo la stanza
