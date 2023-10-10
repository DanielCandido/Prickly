extends Node2D

@onready var player = $Character as CharacterBody2D
@onready var camera = $Camera as Camera2D

var countSec = 0.0
var hour = 6
var current_color = Color(0.0, 0.0, 0.0, 0.2)

func _ready():
	player._follow_camera(camera)
	$Day/Hour.text = str(hour)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var secs = delta
	countSec += secs
	
	
	if countSec >= 1:
		hour += 1.0
		
		if hour == 25:
			hour = 1
		
		countSec = 0
		$Day/Hour.text = str(hour)
		_control_day()


func _control_day():
	match hour:
		5.0:
			current_color = Color(0.0, 0.0, 0.0, 0.3)
		6.0:
			current_color = Color(0.0, 0.0, 0.0, 0.2)
		7.0:
			current_color = Color(0.0, 0.0, 0.0, 0.1)
		10.0:
			current_color = Color(0.0, 0.0, 0.0, 0.0)
		17.0:
			current_color = Color(0.0, 0.0, 0.0, 0.2)
		18.0:
			current_color = Color(0.0, 0.0, 0.0, 0.3)
		20.0:
			current_color = Color(0.0, 0.0, 0.0, 0.7)
		24.0:
			current_color = Color(0.0, 0.0, 0.0, 0.8)
			
	$Day/Color.color = current_color
