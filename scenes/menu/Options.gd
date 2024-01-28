extends Node2D

var muted = false
var muted_SFX = false
var muted_Music = false
var muted_Master = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/SFX_node/Mute_SFX/unchecked/checked.set_visible(false)
	$VBoxContainer/Music/Mute_Music/unchecked/checked.set_visible(false)
	$VBoxContainer/Master2/Mute_Master/unchecked/checked.set_visible(false)
	$VBoxContainer/Node2D/Full_src/unchecked/checked.set_visible(false)
	pass # Replace with function body.
func _change_volume(bus, value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus),value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#Slider
#SFX
func _on_h_slider_value_changed(value):
	_change_volume("SFX", value)
	pass # Replace with function body.
#Music
func _on_h_slider_2_value_changed(value):
	_change_volume("Music", value)
	pass # Replace with function body.
#Master
func _on_h_slider_3_value_changed(value):
	_change_volume("Master", value)
	pass # Replace with function body.


func _on_button_pressed():
	$test.play()
	pass # Replace with function body.

func _on_button_sfx_pressed():
	$VBoxContainer/SFX_node/miaou.play()
	pass # Replace with function body.

func _on_button_music_pressed():
	$VBoxContainer/Music/Music.play()
	pass # Replace with function body.


func _on_mute_sfx_pressed():
	muted_SFX = !muted_SFX
	if (muted_SFX):
		_change_volume("SFX", -80)
		$VBoxContainer/SFX_node/Mute_SFX/unchecked/checked.set_visible(true)
	else:
		_change_volume("SFX", $VBoxContainer/SFX_node/HSlider.value)
		$VBoxContainer/SFX_node/Mute_SFX/unchecked/checked.set_visible(false)
	pass # Replace with function body.

func _on_mute_music_pressed():
	muted_Music = !muted_Music
	if (muted_Music):
		_change_volume("Music", -80)
		$VBoxContainer/Music/Mute_Music/unchecked/checked.set_visible(true)
	else:
		_change_volume("Music", $VBoxContainer/Music/HSlider2.value)
		$VBoxContainer/Music/Mute_Music/unchecked/checked.set_visible(false)
	pass # Replace with function body.


func _on_mute_master_pressed():
	muted_Master = !muted_Master
	if (muted_Master):
		_change_volume("Master", -80)
		$VBoxContainer/Master2/Mute_Master/unchecked/checked.set_visible(true)
	else:
		_change_volume("Master", $VBoxContainer/Master2/HSlider3.value)
		$VBoxContainer/Master2/Mute_Master/unchecked/checked.set_visible(false)

var full = false
func _on_full_src_pressed():
	full = !full
	if (full):
		$VBoxContainer/Node2D/Full_src/unchecked/checked.set_visible(true)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		$VBoxContainer/Node2D/Full_src/unchecked/checked.set_visible(false)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	pass # Replace with function body.
