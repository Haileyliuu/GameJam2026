class_name HotbarContainer
extends CanvasLayer

signal toggled_item(item: int, active: bool)

func _ready() -> void:
	for idx in len($NinePatchRect/hotbar.slots):
		$NinePatchRect/hotbar.slots[idx].toggled_item.connect(echo_toggled_item.bind(idx))
		
	for idx in len(GlobalState.masks):
		if GlobalState.player_has_mask[idx]:
			pickup_item(GlobalState.masks[idx])
		if GlobalState.player_wears_mask[idx]:
			$NinePatchRect/hotbar.slots[idx].set_active(true)

func echo_toggled_item(active, item):
	toggled_item.emit(item, active)

func pickup_item(item: Item):
	$NinePatchRect/hotbar.slots[item.slot].stats = item
