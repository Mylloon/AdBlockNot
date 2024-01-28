extends "res://scripts/ads/ads_default.gd"

func exit_condition():
	return condition
	
func _on_h_slider_value_changed(value):
	print(value)
	if (value >= 98):
		condition = true
