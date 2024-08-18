extends CharacterBody2D

#basic movement
const SPEED = 800.0
const JUMP_VELOCITY = -1000.0
#dash vars
const DASH_SPEED = 2000.0
const DASH_TIME = 0.2
var Dash_Dir = Vector2(0, 0)
#functionality vars
var LetSpaceGo = false
var RollTime = 0
var IsDashing = false
var IsInvul = false
var IsFacingRight = false
func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor() and not IsDashing:
		velocity += get_gravity() * delta * 2
	
	elif is_on_floor():
		LetSpaceGo = false
		#DashTime = 0;
	
	if Input.is_action_just_pressed("Player_Dash"):
		StartDash()
	
	# Handle jump.
	if Input.is_action_just_pressed("Player_Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle Jump Height
	if Input.is_action_just_released("Player_Jump") and not LetSpaceGo and velocity.y <= 0:
		velocity.y = 0 #get_real_velocity().y * 0.25;
		LetSpaceGo = true
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Player_Left", "Player_Right")
	if direction > 0:
		Dash_Dir = Vector2(1, 0)
		IsFacingRight = true
	elif direction < 0:
		Dash_Dir = Vector2(-1, 0)
		IsFacingRight = false
	if not IsDashing:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func StartDash() -> void:	
	# Set dashing and invulnurability
	IsDashing = true
	IsInvul = true
	# Half the distance for AirDashing
	if not is_on_floor():
		velocity = Dash_Dir.normalized() * (DASH_SPEED * 0.75)
	else:
		velocity = Dash_Dir.normalized() * DASH_SPEED
	await(get_tree().create_timer(DASH_TIME)).timeout
	EndDash()

func EndDash() -> void:
	# Reset bools and vars
	velocity = Vector2(0, 0);
	IsDashing = false
	IsInvul = false
