extends Sprite2D

var triggered := false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if triggered:
		return
	if body.is_in_group("Player"):
		triggered = true
		get_tree().call_group("Enemies", "start_chase", body)
