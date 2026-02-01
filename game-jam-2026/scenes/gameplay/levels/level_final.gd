extends Node2D

@onready var interactable: Area2D = $mirror/Interactable
#@onready var fade: CanvasLayer = $Fade

func _ready() -> void:
	interactable.interact = _on_interact
	$UI.toggled_item.connect($Player.toggle_item)

func _on_interact():
	pass
