extends Node2D

@export var IS_RAIN = false
@export var AMOUNT_RAIN = 1
@export var VELOCITY_RAIN = 0.0
@export var TIME_RAIN = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Layer/Particles.emitting = IS_RAIN
	$Layer/Particles.amount = AMOUNT_RAIN
	$Layer/Particles.speed_scale = VELOCITY_RAIN
