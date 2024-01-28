extends Control

var condition = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func exit_condition():
	return condition

func close():
	if exit_condition():
		self.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	close()

func _on_button_pressed():
	print("pressed")
	condition = true
