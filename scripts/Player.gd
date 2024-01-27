extends CharacterBody3D

@onready var head := $Head

const SPEED := 5.0
const MOUSE_SENSITIVITY := 0.15

# Called when the node enters the scene tree for the first time.
func _ready():
	# Trap the cursor on start
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

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()

	# Free cursor
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
