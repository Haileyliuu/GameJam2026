extends Sprite2D

signal podium_placed

var placed_texture: Texture2D =  preload("res://assets/sprites/podium2_placed.png")
@onready var interactable: Area2D = $Interactable2

var placed := false

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact() -> void:
	if placed:
		return
	placed = true

	texture = placed_texture

	emit_signal("podium_placed")
	interactable.queue_free()
