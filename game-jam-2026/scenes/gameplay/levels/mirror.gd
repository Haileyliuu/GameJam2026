extends Node2D

@export var ending_scene_path: String = "res://scenes/gameplay/levels/win_scene.tscn"

@onready var interactable: Area2D = $Interactable
@onready var fade: CanvasLayer = $Fade

var used := false

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact() -> void:
	print("MIRROR INTERACT")
	if used:
		return
	used = true
	print("used = true")
	
	# prevent spam
	interactable.monitoring = false
	interactable.monitorable = false

	# fade and swap scene
	fade.show()
	await fade.fade(1, 1.5).finished
	get_tree().change_scene_to_file(ending_scene_path)
