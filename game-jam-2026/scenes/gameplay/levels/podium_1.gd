extends Sprite2D

signal podium_placed

@export var placed_texture: Texture2D
@onready var interactable: Area2D = $Interactable

var placed := false

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact() -> void:
	if placed:
		return
	placed = true

	texture = placed_texture

	interactable.monitoring = false
	interactable.monitorable = false

	emit_signal("podium_placed")
