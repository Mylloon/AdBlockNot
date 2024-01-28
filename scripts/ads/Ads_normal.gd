extends "res://scripts/ads/ads_default.gd"

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel2/Button.disabled = false
	var images = [	 load("res://ressources/assets/NormalAds/PosterCrab2.png")
					,load("res://ressources/assets/NormalAds/PosterCrab.png")
					,load("res://ressources/assets/NormalAds/PosterMeow2.png")
					,load("res://ressources/assets/NormalAds/PosterMeow.png")
				 ]
	var val = rng.randf_range(0, 4)
	$Sprite2D.set_texture (images[val])
	
	$Sprite2D.set_offset (Vector2($Sprite2D.texture.get_width()/2, ($Sprite2D.texture.get_height()/2)+30))
	pass


func _on_button_pressed():
	condition = true
	print("pressed")
