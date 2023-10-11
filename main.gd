extends Node2D

@onready var player = $Character as CharacterBody2D
@onready var camera = $Camera as Camera2D

var countSec = 0.0
var hour = 5
var minutes = 24
var time = 0.0
var day = 1
var current_color = Color(0.0, 0.0, 0.0, 0.8)

func _ready():
	player._follow_camera(camera)
	var timestamp = "Hora: " + str(hour) + "Minutos: " + str(minutes)
	$Day/Hour.text = timestamp
	$Day/Color.color = current_color
	$Day/DayLabel.text = "Dia: " + str(day)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var secs = delta
	countSec += secs
	if countSec >= 0.4:
		minutes += 1
		time += 0.1
		countSec = 0
		if minutes == 60:
			hour += 1
			minutes = 0
			time = 0
			
	
		
	if hour >= 23:
		hour = 0
		day += 1
		
	var timestamp = "Hora: " + str(hour) + "Minutos: " + str(minutes)
	$Day/Hour.text = timestamp
	$Day/DayLabel.text = "Dia: " + str(day)
	$Day/Color.color = current_color
	_control_day()


func _control_day():
	if (hour == 5 and minutes == 30):
		current_color = Color(0.0, 0.0, 0.0, 0.4)
		return
	
	if (hour == 5 and minutes == 35):
		current_color = Color(0.0, 0.0, 0.0, 0.35)
		return
		
	if (hour == 5 and minutes == 40):
		current_color = Color(0.0, 0.0, 0.0, 0.32)
		return
	
	if (hour == 5 and minutes == 45):
		current_color = Color(0.0, 0.0, 0.0, 0.3)
		return
	
	if (hour == 5 and minutes == 50):
		current_color = Color(0.0, 0.0, 0.0, 0.28)
		return
		
	if (hour == 5 and minutes == 55):
		current_color = Color(0.0, 0.0, 0.0, 0.25)
		return
	
	if (hour == 6 and minutes == 0):
		current_color = Color(0.0, 0.0, 0.0, 0.22)
		return
	
	if (hour == 6 and minutes == 5):
		current_color = Color(0.0, 0.0, 0.0, 0.2)
		return

	if (hour == 7 and minutes == 0):
		current_color = Color(0.0, 0.0, 0.0, 0.1)
		return
	
	if (hour == 10 and minutes == 0):
		current_color = Color(0.0, 0.0, 0.0, 0.0)
		return
		
	if (hour == 17 and minutes == 0):
		current_color = Color(0.0, 0.0, 0.0, 0.2)
		return
		
	if (hour == 17 and minutes == 30):
		current_color = Color(0.0, 0.0, 0.0, 0.3)
		return
		
	if (hour == 17 and minutes == 35):
		current_color = Color(0.0, 0.0, 0.0, 0.4)
		return
		
	if (hour == 17 and minutes  == 45):
		current_color = Color(0.0, 0.0, 0.0, 0.5)
		return
	
	if (hour == 17 and minutes == 55):
		current_color = Color(0.0, 0.0, 0.0, 0.6)
		return
		
	if (hour == 18 and minutes == 0):
		current_color = Color(0.0, 0.0, 0.0, 0.7)
		return
		
	if (hour == 19 and minutes == 0):
		current_color = Color(0.0, 0.0, 0.0, 0.8)
		return

