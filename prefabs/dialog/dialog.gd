extends CanvasLayer
@export var messagesPath : String = ""

@onready var MSG := $Bg/Msg
@onready var AUTHOR := $Bg/Author
@onready var PROFILE := $Profile/Texture

var messages: Array
var show_dialog = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_load_messages()
	
func _load_messages():
	if FileAccess.file_exists(messagesPath):
		var dataFile = FileAccess.open(messagesPath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		messages = parsedResult
	else:
		print("File doesn't exist!")

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept") and show_dialog:
		_show_message()
		
func _show_dialog():
	show_dialog = true
	_show_message()
	
func _show_message():
	MSG.visible_characters = 0;
	
	if not $Bg/Timer.is_stopped():
		MSG.visible_characters = MSG.get_total_character_count()
		return
	
	if messages.size() == 0:
		_close_dialog()
		return
		
	var _msg = messages.pop_front()
	
	MSG.text = _msg.message
	AUTHOR.text = _msg.author
	PROFILE.texture = load(_msg.icon_path)
	$Bg/Timer.start()
	
func _close_dialog():
	show_dialog = false
	_load_messages()
	hide()


func _on_timer_timeout():
	if MSG.visible_characters == MSG.get_total_character_count():
		$Bg/Timer.stop()
	MSG.visible_characters += 1
