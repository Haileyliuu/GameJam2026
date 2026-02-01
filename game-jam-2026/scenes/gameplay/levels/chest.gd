extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@export var item: Item
@export var player: Player

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	print("interact with item!")
	if item:
		player.pickup(item)
	
