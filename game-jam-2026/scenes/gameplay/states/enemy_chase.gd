extends State
class_name EnemyChase


var player : CharacterBody2D
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
		var dir := direction.normalized()
		enemy.velocity = dir * speed
		if dir.length() > 0.001:
			enemy.rotation = dir.angle()
	else:
		enemy.velocity = Vector2.ZERO
	
	#if direction.length() > 50: 
		#transition.emit(self, "idle")
	 

	enemy.move_and_slide()
	
