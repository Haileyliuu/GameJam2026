extends Node2D

@onready var mirror_interactable: Area2D = $mirror/Interactable
@onready var mirror_shape: CollisionShape2D = $mirror/Interactable/CollisionShape2D

@onready var podiums := [
	$podium1,
	$podium2,
	$podium3
]

var podiums_completed := 0

func _ready() -> void:
	# Disable mirror at start
	_set_mirror_enabled(false)

	# Connect each podium's signal
	for p in podiums:
		p.podium_placed.connect(_on_podium_placed)

func _on_podium_placed() -> void:
	podiums_completed += 1
	print("Podiums completed:", podiums_completed)

	if podiums_completed >= 3:
		_set_mirror_enabled(true)

func _set_mirror_enabled(enabled: bool) -> void:
	mirror_interactable.monitoring = enabled
	mirror_interactable.monitorable = enabled
	mirror_shape.disabled = !enabled
