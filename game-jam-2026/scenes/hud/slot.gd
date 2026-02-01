extends Button

@onready var player = get_tree().current_scene.find_child("player")

@export var stats: Item = null:
	set(value):
		stats = value
		icon = value.icon if value else null

var is_active := false

func set_active(value: bool):
	is_active = value
	disabled = not value  # optional visual feedback

func _input(event):
	if not is_active:
		return

	if event.is_action_pressed("use"):
		use_item()

func use_item():
	if stats == null:
		return

	print("Using item:", stats.name)
	# apply stats to player here
