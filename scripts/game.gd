extends Control

var window = preload("res://scenes/game/windows/Windows.tscn")
var instance = window.instantiate()

func new_ads():
	instance.position = Vector2(10.0, 5.0)
	var _size = instance.get_rect()
	print(_size)
	add_child(instance) # Replace with function body.

# Called when the node enters the scene tree for the first time.
func _ready():
	new_ads()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
