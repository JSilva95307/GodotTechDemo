class_name Player extends CharacterBody2D

#basic movement
@export var SPEED = 800.0
@export var JUMP_VELOCITY = -1000.0
#dash vars
@export var DASH_SPEED = 2000.0
@export var DASH_TIME = 0.2
@export var Dash_Dir = Vector2(0, 0)
@export var Can_Dash = true
@export var Dash_Cooldown = 1.5
#functionality vars
@export var LetSpaceGo = false
@export var RollTime = 0
@export var IsDashing = false
@export var IsInvul = false
@export var IsFacingRight = false

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor() and not IsDashing:
		velocity += get_gravity() * delta * 2
	
	move_and_slide()

func StartDashCD() :
	Can_Dash = false
	print_debug("Dash Cooling down!")
	await(get_tree().create_timer(Dash_Cooldown)).timeout
	Can_Dash = true
	print_debug("Dash is ready!")

#func StartDash() -> void:	
	## Set dashing and invulnurability
	#IsDashing = true
	#IsInvul = true
	## Half the distance for AirDashing
	#if not is_on_floor():
		#velocity = Dash_Dir.normalized() * (DASH_SPEED * 0.75)
	#else:
		#velocity = Dash_Dir.normalized() * DASH_SPEED
	#await(get_tree().create_timer(DASH_TIME)).timeout
	#EndDash()
#
#func EndDash() -> void:
	## Reset bools and vars
	#velocity = Vector2(0, 0);
	#IsDashing = false
	#IsInvul = false
