extends State
class_name EnemyChase


var player
@export var speed := 100
@export var enemy : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("using this")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#position += (player.position - position).normalized() * 50 * delta

func enter():
	print("enter")
	player = get_tree().get_first_node_in_group("Player")

func physics_update(_delta: float):
	#if player:
	#print("physics")
	var direction = player.global_position - enemy.global_position
	
	
	if direction.length() > 20:
		enemy.velocity = direction.normalized() * speed
	else:
		enemy.velocity = Vector2.ZERO
	 

	enemy.move_and_slide()
	
