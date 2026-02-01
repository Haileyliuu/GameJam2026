extends Sprite2D

var triggered := false
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if triggered:
		return
	if body.is_in_group("Player"):
		triggered = true

		var p := $AudioStreamPlayer
		remove_child(p)
		get_tree().current_scene.add_child(p)
		#p.global_position = global_position
		

		get_tree().call_group("Enemies", "start_chase", body)

		queue_free()
		p.play()
