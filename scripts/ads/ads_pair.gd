extends "res://scripts/ads/ads_default.gd"

var hold    := [-1, -1] # current selection
var correct := [-1, -1] # good selection
var alterne := false    # change la valeur de gauche ou de droite

@onready var image1 := $PairWallpaper/GridContainer/Button1
@onready var image2 := $PairWallpaper/GridContainer/Button2
@onready var image3 := $PairWallpaper/GridContainer/Button3
@onready var image4 := $PairWallpaper/GridContainer/Button4
@onready var image5 := $PairWallpaper/GridContainer/Button5
@onready var image6 := $PairWallpaper/GridContainer/Button6

var buttons
var images

func _ready():
	buttons = [image1, image2, image3, image4, image5, image6]
	images = [ load("res://ressources/assets/Pair/Card_1_V2.png")
			 , load("res://ressources/assets/Pair/Card_2_V2.png")
	 		 , load("res://ressources/assets/Pair/Card_3_V2.png")
			 , load("res://ressources/assets/Pair/Card_4_V2.png")
			 , load("res://ressources/assets/Pair/Card_5_V2.png") ]
	var selection = images.pick_random()
	images.push_back(selection)
	images.shuffle()
	
	for i in range(0, images.size()):
		if images[i] == selection:
			if correct[0] == -1:
				correct[0] = i
			else:
				correct[1] = i
				break
				

	# Apply texture to buttons
	for i in range(0, buttons.size()):
		buttons[i].icon = images[i]

func exit_condition():
	return condition

func _on_pressed(num):
	# Click reset
	if hold[0] == num:
		hold[0] = -1
	if hold[1] == num:
		hold[1] = -1

	# Click rotation
	if alterne:
		# Droit
		hold[1] = num
	else:
		# Gauche
		hold[0] = num

	# Verification
	condition = hold[0] == correct[0] and hold[1] == correct[1]
	
	# Alternation
	alterne = !alterne
	
	# Reset colors
	for i in range(0, buttons.size()):
		buttons[i].icon = images[i]
		
	# TODO: Color grayscale ou un truc du genre
