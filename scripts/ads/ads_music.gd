extends "res://scripts/ads/ads_default.gd"

@onready var button := $MusicButton/Button
@onready var player := $AudioStreamPlayer

func _ready():
	await get_tree().create_timer(randf_range(0, 2.5)).timeout
	player.play()

func exit_condition():
	return condition

func _on_button_pressed():
	condition = true
