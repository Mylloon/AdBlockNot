extends RigidBody3D

@onready var head := $Head

const SPEED := 1200.0
const MOUSE_SENSITIVITY := 0.15

# Called when the node enters the scene tree for the first time.
func _ready():
	# Change input mode
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called at each input
func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		# Move the camera axis
		rotate_y(-deg_to_rad(event.relative.x * MOUSE_SENSITIVITY))
		head.rotate_x(-deg_to_rad(event.relative.y * MOUSE_SENSITIVITY))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))
	if event is InputEventMouseButton and event.button_index == 1:
		# Trap the cursor on click
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Movement
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.z = Input.get_axis("move_forward", "move_backward")
	apply_central_force(basis * input.normalized() * SPEED * delta)

	# Free cursor
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
