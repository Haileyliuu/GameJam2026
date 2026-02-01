extends Area2D

@export var stats: Item
func _ready() -> void:
	$Sprite2D.texture = stats.icon if stats else null

func someone_entered(who: Area2D):
	if who is PlayerPickupArea:
		who.player.pickup(stats)
		queue_free()
