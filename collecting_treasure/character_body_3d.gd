extends CharacterBody3D

# Movement variables
var speed = 5.0
var jump_velocity = 10.0
var gravity = -24.8

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jumping
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = jump_velocity

	# Get input direction
	var input_dir = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		input_dir.z -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.z += 1
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1

	# Normalize input direction and apply movement
	input_dir = input_dir.normalized()
	velocity.x = input_dir.x * speed
	velocity.z = input_dir.z * speed

	# Move the player
	move_and_slide()
