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
@export var direction = 0
#health and number vars
@export var health = 20.0

var cur_dir = 1
signal player_death

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and not IsDashing:
		velocity += get_gravity() * delta * 2
	direction = Input.get_axis("Player_Left", "Player_Right")
	if cur_dir != direction and direction != 0:
		flip_player()
	move_and_slide()

func StartDashCD() :
	Can_Dash = false
	print_debug("Dash Cooling down!")
	await(get_tree().create_timer(Dash_Cooldown)).timeout
	Can_Dash = true
	print_debug("Dash is ready!")

func take_damage(damage: float) -> void:
	health -= damage
	print_debug( str(damage) + " damage taken!")
	print_debug( str(health) + " health remains!")
	if health <= 0:
		player_death.emit()

func heal(heal_amount : float) -> void:
	health += abs(heal_amount)

func flip_player() -> void:
	scale.x *= -1
	cur_dir = direction
