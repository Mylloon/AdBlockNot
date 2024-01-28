extends "res://scripts/ads/ads_default.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func exit_condition():
	return condition
	
func _on_h_slider_value_changed(value):
	print(value)
	if (value > 98):
		condition = true

