extends Sprite2D
class_name EnemyPatrol

@export var all_markers: Array[Node2D] = []
@export var speed: float = 200
func _ready():
	current_target_marker = all_markers[0]


var current_target_marker

func _process(delta):
	position += (current_target_marker.position - position).normalized() * speed * delta
	
	if (current_target_marker.position - position).length() < 20:
		var next_marker_index = all_markers.find(current_target_marker) + 1
		if next_marker_index >= len(all_markers):
			next_marker_index = 0
		current_target_marker = all_markers[next_marker_index]


func break_patrol(anything_that_enters):
	current_target_marker = anything_that_enters.get_parent()
