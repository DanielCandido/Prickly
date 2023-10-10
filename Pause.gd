extends CanvasLayer

@onready var playBtn := $Menu/PlayBtn
# Called when the node enters the scene tree for the first time.
func _ready():
	var window_size = get_window().size
	$BG.size = window_size
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
		playBtn.grab_focus()



func _on_play_btn_pressed():
	get_tree().paused = false
	visible = false


func _on_quit_btn_pressed():
	get_tree().quit()
