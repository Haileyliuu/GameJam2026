extends State
class_name EnemyPatrol

@export var enemy: CharacterBody2D
@export var speed: float = 100
@export var arrive_dist: float = 20

var points: Array[Vector2] = []
var idx := 0

func enter():
	points.clear()
	idx = 0

	var track = enemy.patrol_track

	for child in track.get_children():
		if child is Marker2D:
			points.append(child.global_position)
	enemy.global_position = points[0]
	enemy.velocity = Vector2.ZERO

func physics_update(_delta: float):
	if points.is_empty() or enemy == null:
		return

	var target := points[idx]
	var to_target := target - enemy.global_position

	# Switch to next marker when close
	if to_target.length() <= arrive_dist:
		idx = (idx + 1) % points.size()
		target = points[idx]
		to_target = target - enemy.global_position

	enemy.velocity = to_target.normalized() * speed
