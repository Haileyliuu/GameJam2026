extends TextureButton

@onready var player = get_tree().current_scene.find_child("player")

signal toggled_item(active: bool)

func _ready() -> void:
	disabled = true

@export var stats: Item = null:
	set(value):
		stats = value
		$TextureRect.texture = value.icon if value else null
		disabled = value == null

var is_active := false

func set_active(value: bool):
	if disabled:
		return
	is_active = value
	button_pressed = value
	toggled_item.emit(value)

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
