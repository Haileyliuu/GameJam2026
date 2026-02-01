extends Node

const masks = [
	preload("res://scenes/hud/item1.tres"),
	preload("res://scenes/hud/item2.tres"),
	preload("res://scenes/hud/item3.tres")
	
]

var player_has_mask: Dictionary[int, bool] = {
	0: false,
	1: false,
	2: false,
}
var player_wears_mask: Dictionary[int, bool] = {
	0: false,
	1: false,
	2: false,
}
