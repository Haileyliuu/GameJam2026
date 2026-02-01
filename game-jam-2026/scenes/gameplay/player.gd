extends CharacterBody2D

const SPEED = 50
@onready var animated_sprite = $AnimatedSprite2D
@warning_ignore("unused_parameter")
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction != Vector2.ZERO:
		velocity = direction * SPEED

		# Flip based on horizontal direction
		if direction.x != 0:
			animated_sprite.flip_h = direction.x < 0

		animated_sprite.play("walk_right")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		animated_sprite.play("idle_right")

	move_and_slide()
