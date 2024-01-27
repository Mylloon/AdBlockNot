extends Node2D
@onready var transition = $fade
# Called when the node enters the scene tree for the first time.

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	transition.play("fade_in")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	$on_sound.play()
	
func _on_on_sound_finished():
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
	pass # Replace with function body.
