extends "res://scripts/ads/ads_default.gd"

@onready var question  := $Question
@onready var responseA := $Button1
@onready var responseB := $Button2

enum OP {
  ADD,
  SUB,
  MUL,
}

var reponse

func _ready():
	new_game()

func new_game():
	var a := randi_range(0, 9)
	var b := randi_range(0, 9)
	
	var operation = OP.values().pick_random()
	var operator := ""
	
	match operation:
		OP.ADD:
			reponse = a + b
			operator = "+"
		OP.SUB:
			reponse = a - b
			operator = "-"
		OP.MUL:
			reponse = a * b
			operator = "x"
	
	question.text = str(str(a), " ", operator, " " , str(b))
	
	var buttons := [responseA, responseB]
	buttons.shuffle()
	buttons[0].text = str(reponse)
	buttons[1].text = str(randi_range(-10, 30))

func exit_condition():
	return condition

func _on_button_1_pressed():
	check(int(responseA.text))

func _on_button_2_pressed():
	check(int(responseB.text))

func check(data):
	if data == reponse:
		condition = true
	else:
		new_game()
