extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -1000.0
var LetSpaceGo = false
var ReachedApex = false
func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 2
	elif is_on_floor():
		LetSpaceGo = false
		ReachedApex = false
	
	# Handle jump.
	if Input.is_action_just_pressed("Player_Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle Jump Height
	if Input.is_action_just_released("Player_Jump") and not LetSpaceGo and velocity.y <= 0:
		velocity.y = 0 #get_real_velocity().y * 0.25;
		LetSpaceGo = true
		ReachedApex = true
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
