extends HBoxContainer

@onready var slots = get_children()

var _current_index := 0

var current_index: int:
	set(value):
		value = clamp(value, 0, slots.size() - 1)
		if value == _current_index:
			return

		_deactivate_slot(_current_index)
		_current_index = value
		_activate_slot(_current_index)

func _ready():
	current_index = 0

func _input(event):
	if event.is_action_pressed("equip_item1"):
		current_index = 0
	elif event.is_action_pressed("equip_item2"):
		current_index = 1
	elif event.is_action_pressed("equip_item3"):
		current_index = 2
	elif event.is_action_pressed("equip_item4"):
		current_index = 3

func _activate_slot(index: int):
	var slot := slots[index] as Button
	slot.grab_focus()
	slot.set_active(true)
	
func _deactivate_slot(index: int):
	var slot := slots[index] as Button
	slot.set_active(false)
