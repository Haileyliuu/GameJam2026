class_name Player
extends CharacterBody2D

@export var hud: HotbarContainer

func _physics_process(_delta):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 150
	move_and_slide()
	
	
func pickup(item: Item):
	if hud:
		hud.pickup_item(item)
		
func toggle_item(item:int, active:bool):
	prints("the player", "is" if active else "isn't", "wearing", item)
