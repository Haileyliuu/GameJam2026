extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var fade: CanvasLayer = $Fade

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	pass
