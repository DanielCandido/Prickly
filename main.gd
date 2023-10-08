extends Node2D

@onready var player = $Character as CharacterBody2D
@onready var camera = $Camera as Camera2D

func _ready():
	player._follow_camera(camera)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
