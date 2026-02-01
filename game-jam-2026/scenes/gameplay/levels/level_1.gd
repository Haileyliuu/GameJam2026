extends Node2D

@onready var interactable: Area2D = $Interactable
@onready var fade: CanvasLayer = $Fade

func _ready() -> void:
	interactable.interact = _on_interact
	$UI.toggled_item.connect($Player.toggle_item)

func _on_interact():
	print("interact!")
	fade.show()
	await fade.fade(1, 1.5).finished
	get_tree().change_scene_to_file("res://scenes/gameplay/levels/level_2.tscn")
