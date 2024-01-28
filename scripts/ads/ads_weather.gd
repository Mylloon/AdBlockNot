extends "res://scripts/ads/ads_default.gd"

@onready var image1 := $Fond/GridContainer/Image1
@onready var image2 := $Fond/GridContainer/Image2
@onready var image3 := $Fond/GridContainer/Image3

var good_image

func _ready():
	var images = [ load("res://ressources/assets/Weather/CloudyV2.png")
				 , load("res://ressources/assets/Weather/RainyV2.png")
				 , load("res://ressources/assets/Weather/SunnyV2.png") ]
	images.shuffle()
	for i in range(0, images.size()):
		if images[i].resource_path.contains("Sunny"):
			good_image = i + 1

	image1.icon = images[0]
	image2.icon = images[1]
	image3.icon = images[2]

func exit_condition():
	return condition

func _on_pressed(num):
	condition = num == good_image
