extends CharacterBody2D

func _ready():
	$Dialog.visible = false

func _process(delta):
	if Input.is_action_just_pressed("interaction") and $Interaction.troop != null:
		$Dialog.visible = true
		$Dialog._show_dialog()
	
	if $Interaction.troop == null and $Dialog.show_dialog:
		$Dialog._close_dialog()
		
