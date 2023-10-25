extends Node2D

@onready var player = $Character as CharacterBody2D
@onready var camera = $Camera as Camera2D

#RAIN STATE
var probability_rain = 0
var amount_rain = 0
var time_rain = 0.0
var rain_value = 2
var velocity_rain = 0
var is_rain = false

var count_sec = 0.0
var hour = 8
var minutes = 24
var time = 0.0
var day = 1
var current_color = Color(0.0, 0.0, 0.0, 0.0)

func _ready():
	player._follow_camera(camera)
	_rain()
	var timestamp = "Hora: " + str(hour) + "Minutos: " + str(minutes)
	$Day/Hour.text = timestamp
	$Day/Color.color = current_color
	$Day/DayLabel.text = "Dia: " + str(day)
	_control_day()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var secs = delta
	count_sec += secs
	if count_sec >= 0.4:
		minutes += 1
		time += 0.1
		count_sec = 0
		if minutes == 60:
			hour += 1
			minutes = 0
			time = 0
			
	
		
	if hour > 23:
		hour = 0
		day += 1
		_rain()
			
	
	$Day/Hour.text = formatTime()
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

func formatTime():
	var formatHour
	var formatMinute
	
	if hour <= 9:
		formatHour = "0" + str(hour)
	else:
		formatHour = str(hour)
		
	if minutes <= 9:
		formatMinute = "0" + str(minutes)
	else:
		formatMinute = str(minutes)
	
	return formatHour + ":" + formatMinute

func _rain():
	probability_rain = randi_range(1, 3)
	amount_rain = randi_range(600, 2000)
	time_rain = randi_range(3.0, 10.0)
	velocity_rain = randi_range(1, 4)
	var is_new_rain = probability_rain == rain_value
	print(is_new_rain)
	if is_rain != is_new_rain:
		$Rain.IS_RAIN = is_new_rain
		is_rain = true
	$Rain.AMOUNT_RAIN = amount_rain
	$Rain.VELOCITY_RAIN = velocity_rain
