extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var last_direction = Vector2.ZERO
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gold = 230.0

@onready var remote_transform := $Remote as RemoteTransform2D
@onready var inventory := $Inventory

#animations
var _state_machine
@export_category("Objects")
@export var _animation_tree: AnimationTree = null

func _ready():
	_state_machine = _animation_tree["parameters/playback"]

func _process(delta):
	$Inventory.GOLD_AMOUNT = gold

func _physics_process(delta):
	_move()
	_animated()

func _move():
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		direction += Vector2(0, 1)
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1, 0)

	direction = direction.normalized()
	
	if direction != Vector2.ZERO:
		last_direction = direction
	
	velocity = direction * SPEED
	
	_state(direction)
	
	move_and_slide()
	
func _state(dir: Vector2):
#	_animation_tree["parameters/walk/blend_position"].x = dir.x
#	_animation_tree["parameters/walk/blend_position"].y = dir.y
	_animation_tree["parameters/idle/blend_position"].x = last_direction.x
	_animation_tree["parameters/idle/blend_position"].y = last_direction.y
	

func _follow_camera(camera):
	var camera_path = camera.get_path()
	remote_transform.remote_path = camera_path
	

func _animated():
#	if velocity != Vector2.ZERO:
#		_state_machine.travel("walk")
#		return
		
	_state_machine.travel("idle")
