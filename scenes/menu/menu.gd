extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu/Options/Rules.set_visible(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_power_off_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/leaving_scene.tscn")

func _on_normal_start_pressed():
	#get_tree().change_scene_to_file("")
	pass # Replace with function body.

func _on_infinite_start_pressed():
	#get_tree().change_scene_to_file("")
	pass # Replace with function body.

func _on_options_pressed():
	$Menu/Options/Rules.set_visible(true)
	pass # Replace with function body.

func _on_close_pressed():
	$Menu/Options/Rules.set_visible(false)
	pass # Replace with function body.
