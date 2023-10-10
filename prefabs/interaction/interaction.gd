extends Node2D

var show_interaction = false
var troop = null
@export var label: String = ""
@export var interaction: String = ""
@export var width: float = 88
@export var height: float = 88
@export var action: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var rect_shape = RectangleShape2D.new()
	rect_shape.size = Vector2(width / 2, height /2)
	
	$AreaInteraction/Collision.shape = rect_shape


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(interaction) and is_instance_valid(troop):
		if owner.has_method(action):
			owner.call(action, troop)


func _on_area_interaction_body_entered(body):
	if body.is_in_group("player"):
		show_interaction = true
		var action = InputMap.action_get_events(interaction)[0]
		var key = action.as_text().split(" ")[0]
		var image = load("res://addons/controller_icons/assets/key/" + str(key) + ".png")
		$AreaInteraction/Label.text = label
		$AreaInteraction/Label.visible = true
		$AreaInteraction/Label/Icon.texture = image
		$AreaInteraction/Label/Icon.visible = true
		troop = body


func _on_area_interaction_body_exited(body):
	if body.is_in_group("player"):
		show_interaction = false
		$AreaInteraction/Label.text = ""
		$AreaInteraction/Label.visible = false
		$AreaInteraction/Label/Icon.texture = null
		$AreaInteraction/Label/Icon.visible = false
		troop = null
