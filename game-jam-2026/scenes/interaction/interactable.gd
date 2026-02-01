extends Area2D
@export var interact_name: String = ""
@export var is_interactable:bool = true
@onready var podium1: Sprite2D = $podium1

var podium1_placed = preload("res://assets/sprites/podium1_placed.png")

var interact: Callable = func():
	#podium1.texture = podium1_placed
	pass
