class_name Player
extends CharacterBody2D

@export var hud: HotbarContainer
var enabled_input = true

const SPEED = 50
@onready var animated_sprite = $AnimatedSprite2D
@warning_ignore("unused_parameter")
func _physics_process(delta):
	if not enabled_input:
		return
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
	GlobalState.player_has_mask[item.slot] = true
		
func toggle_item(item:int, active:bool):
	if not enabled_input:
		return

	prints("the player", "is" if active else "isn't", "wearing", item)
	GlobalState.player_wears_mask[item] = active


func bump_into_enemy(enemy: Enemy):
	var enemy_ignored = true
	for idx in len(enemy.mask_pieces):
		if enemy.mask_pieces[idx]!=GlobalState.player_wears_mask[idx]:
			enemy_ignored = false
			break
	if enemy_ignored:
		prints("The enemy ignored the player because masks match")
	else:
		prints("Enemy hit the player")
		game_over()

signal player_died
func game_over():
	enabled_input = false
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color.BLACK, 1.0)
	tween.tween_callback(player_died.emit)
	get_tree().change_scene_to_file("res://scenes/gameplay/levels/jumpscare/jumpscare.tscn")
	
