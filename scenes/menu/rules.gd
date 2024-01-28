extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Node2D/Node2D/valid_options.set_visible(false)
	$Node2D/Op/Help_panel/valid_help.set_visible(true)
	$Node2D/Node2D/Options.set_visible(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_hlp_pressed():
	$Node2D/Node2D/valid_options.set_visible(false)
	$Node2D/Op/Help_panel/valid_help.set_visible(true)
	$Node2D/Node2D/Options.set_visible(false)
	pass # Replace with function body.


func _on_button_opt_pressed():
	$Node2D/Node2D/valid_options.set_visible(true)
	$Node2D/Op/Help_panel/valid_help.set_visible(false)
	$Node2D/Node2D/Options.set_visible(true)
	pass # Replace with function body.
	
func _on_power_off_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")

