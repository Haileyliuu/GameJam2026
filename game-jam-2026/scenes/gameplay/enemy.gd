extends CharacterBody2D
class_name Enemy

@export var patrol_track : Node
var target_player : Node2D
var popped := false



func _physics_process(delta: float) -> void:
	move_and_slide()

func start_chase(player: Node2D):
	if popped:
		return
	popped = true
	target_player = player
	$StateMachine.force_state("EnemyChase")
