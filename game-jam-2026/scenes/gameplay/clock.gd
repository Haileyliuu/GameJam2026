extends Node2D

var time = 0.0

func _process(delta: float) -> void:
	time += delta
	$Line2D1.points = [Vector2.ZERO, Vector2.RIGHT.rotated(time) * 4]
	$Line2D2.points = [Vector2.ZERO, Vector2.RIGHT.rotated(-time) * 2]
