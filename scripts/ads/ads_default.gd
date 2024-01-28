extends "res://scripts/ads.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel2/Button.disabled = true
	pass
	

func exit_condition():
	return condition

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	close()

func _on_button_pressed():
	print("pressed")
