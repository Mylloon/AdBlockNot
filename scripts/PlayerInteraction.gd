extends RayCast3D

@onready var prompt := $Label

func _physics_process(_delta):
	prompt.set_text("")
	if is_colliding():
		if get_collider() is Interactable:
			prompt.set_text("Regarder un film sur www3.yggtorrent.qa")
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				get_tree().change_scene_to_file("res://Scenes/menu/go_in.tscn")
