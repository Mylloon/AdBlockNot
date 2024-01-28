extends Control
var ads_scene = []
var ads = []
"""
var ads_scene = [preload("res://scenes/game/ads/Ads_password.tscn"), 
preload("res://scenes/game/ads/Ads_sudoku.tscn")]
"""

func getFilePathsByExtension(directoryPath: String, extension: String) -> Array:
	var dir =  DirAccess.open(directoryPath)
	if !dir :
		printerr("Warning: could not open directory: ", directoryPath)
		return []
	
	var filePaths := []
	if dir:
		dir.list_dir_begin()
		var fileName = dir.get_next()
		while fileName != "":
			if dir.current_is_dir():
				print("Found directory: " + fileName)
			else:
				print("Found file: " + fileName)
				if fileName.get_extension() == extension:
					var filePath = dir.get_current_dir() + "/" + fileName
					filePaths.append(filePath)
			fileName = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	return filePaths

func new_ads():
	print("her")
	randomize()
	var _range = randi_range(0, ads_scene.size()-1)
	var instance = ads_scene[_range].instantiate()
	add_child(instance) # Replace with function body.
	var _scale = Vector2(0.5,0.5)
	instance.scale = _scale
	var _size = instance.get_size() * _scale
	print(_size)
	instance.position.x = randf_range(1, get_viewport_rect().size.x - (_size.x))
	instance.position.y = randf_range(1, get_viewport_rect().size.y - (_size.y*1.5))
	ads.push_back(instance)
	print(instance.position)

# Called when the node enters the scene tree for the first time.
func load_scene():
	for scene in [ "res://scenes/game/ads/ads_music.tscn"
				 , "res://scenes/game/ads/ads_normal.tscn"
				 , "res://scenes/game/ads/ads_operation.tscn"
				 , "res://scenes/game/ads/ads_pair.tscn"
				 , "res://scenes/game/ads/ads_roll.tscn"
				 , "res://scenes/game/ads/ads_sexy_robot.tscn"
				 , "res://scenes/game/ads/ads_weather.tscn" ]:
		ads_scene.push_back(load(scene))

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		pass # todo one day ahah ^^
		# $Rules.set_visible(true)

func _ready():
	load_scene()
	print(ads_scene)
	for n in 15:
		new_ads()
	
func win():
	for ad in ads:
		if ad.visible == true :
			return false
	return true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if win():
		for n in 15:
			new_ads()
		# get_tree().change_scene_to_file("res://scenes/game/victoire.tscn")
