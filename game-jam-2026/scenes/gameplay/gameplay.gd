extends Node

func _ready() -> void:
	$UI.toggled_item.connect($player.toggle_item)
