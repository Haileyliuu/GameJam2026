class_name Player
extends CharacterBody2D

@export var hud: HotbarContainer

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

	
func pickup(item: Item):
	if hud:
		hud.pickup_item(item)
		
func toggle_item(item:int, active:bool):
	prints("the player", "is" if active else "isn't", "wearing", item)
