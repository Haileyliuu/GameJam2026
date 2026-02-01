class_name HotbarContainer
extends CanvasLayer

signal toggled_item(item: int, active: bool)

func _ready() -> void:
	for idx in len($NinePatchRect/hotbar.slots):
		$NinePatchRect/hotbar.slots[idx].toggled_item.connect(echo_toggled_item.bind(idx))

func echo_toggled_item(active, item):
	toggled_item.emit(item, active)

func pickup_item(item: Item):
	$NinePatchRect/hotbar.slots[item.slot].stats = item
