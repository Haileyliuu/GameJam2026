extends Control

@onready var btn_play = $MarginContainer/Control/VBoxContainer/PlayButton
@onready var btn_exit = $MarginContainer/Control/VBoxContainer/ExitButton
@onready var subviewport: SubViewport = $ColorRect/SubViewport
@onready var anim_player: AnimationPlayer = subviewport.get_node(
	"menu_background/epic_opening"
)
@onready var spotlight: SpotLight3D = subviewport.get_node(
	"menu_background/spotlight"
)

var light_tween: Tween
const LIGHT_ENERGY := 5.0
const LIGHT_TWEEN_TIME := 0.3

func _ready():
	# needed for gamepads to work
	btn_play.grab_focus()
	if OS.has_feature('web'):
		btn_exit.queue_free() # exit button dosn't make sense on HTML5
	$AudioStreamPlayer.play()

func _on_PlayButton_pressed() -> void:
	anim_player.play("RESET")
	await anim_player.animation_finished
	
	var params = {
		"show_progress_bar": true,
		"a_number": 10,
		"a_string": "Ciao!",
		"an_array": [1, 2, 3, 4],
		"a_dict": {
			"name": "test",
			"val": 15
		},
	}
	GGT.change_scene("res://scenes/gameplay/levels/level_1.tscn", params)


func _on_ExitButton_pressed() -> void:
	# gently shutdown the game
	var transitions = get_node_or_null("/root/GGT_Transitions")
	if transitions:
		transitions.fade_in({
			'show_progress_bar': false
		})
		await transitions.anim.animation_finished
		await get_tree().create_timer(0.3).timeout
	get_tree().quit()


func _turn_light_on():
	if light_tween:
		light_tween.kill()

	light_tween = create_tween()
	light_tween.tween_property(
		spotlight,
		"light_energy",
		LIGHT_ENERGY,
		LIGHT_TWEEN_TIME
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)


func _turn_light_off():
	if light_tween:
		light_tween.kill()

	light_tween = create_tween()
	light_tween.tween_property(
		spotlight,
		"light_energy",
		0.0,
		LIGHT_TWEEN_TIME
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)


func _on_play_button_mouse_entered() -> void:
	_turn_light_on()


func _on_play_button_mouse_exited() -> void:
	_turn_light_off()


func _on_focus_entered() -> void:
	_turn_light_on()


func _on_focus_exited() -> void:
	_turn_light_off()
