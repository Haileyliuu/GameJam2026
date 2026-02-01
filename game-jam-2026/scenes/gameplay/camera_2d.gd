extends Camera2D

@onready var player = $"../Player"

@export var SPEED = 10

func _process(delta):
	position = lerp(position, player.position, SPEED*delta)
