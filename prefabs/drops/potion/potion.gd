extends Area2D

const Item = preload("res://dictionary/item.gd")
const ItemData = preload("res://dictionary/items_dictionary.gd")

var collectable_data

# Called when the node enters the scene tree for the first time.
func _ready():
	collectable_data = ItemData.new().all_items["small_healing_potion"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _collect_item(troop):
	if is_instance_valid(troop):
		troop.inventory.send_item(collectable_data)

		if get_parent() is RigidBody2D:
			get_parent().queue_free()
			return
	
		queue_free()
