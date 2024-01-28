extends "res://scripts/ads/ads_default.gd"

@onready var button      := $ButtonDice/Button
@onready var label_left  := $Dice/Left
@onready var label_right := $Dice/Right

func _ready():
	label_left.text  = "0"
	label_right.text = "0"

func exit_condition():
	return condition

func _on_button_pressed():
	var left  := randi_range(0, 6)
	var right := randi_range(0, 6)
	
	label_left.text  = str(left)
	label_right.text = str(right)
	
	condition = left + right >= 5
