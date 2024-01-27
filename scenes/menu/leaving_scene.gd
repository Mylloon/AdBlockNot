extends Node2D
@onready var transition = $Fade_out

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$off_sound.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_leave_timeout():
	get_tree().quit()


func _on_timer_fade_timeout():
	transition.play("fade_out")
	pass # Replace with function body.
