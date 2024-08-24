extends State
class_name  SlimeAttack

@export var enemy : CharacterBody2D
@export var move_speed := 50
@export var animation : AnimationPlayer
@export var cooldown : float
@export var jump_heigth : float
@export var jump_time_to_peak: float
@export var jump_time_to_descent : float
@export var Check_floor : RayCast2D

@onready var jump_velocity :float = ((2.0*  jump_heigth) / jump_time_to_peak) *-1
@onready var jump_gravity: float = ((-2.0*  jump_heigth) / (jump_time_to_peak * jump_time_to_peak)) *-1
@onready var fall_gravity: float  = ((-2.0*  jump_heigth) / (jump_time_to_descent  * jump_time_to_descent)) *-1

var is_ready:bool = true
var player : CharacterBody2D
var distance : Vector2


func Enter():
	#check to see if state is following

	print("Attack")
	player = get_tree().get_first_node_in_group("Player")
	

	

	
func Physics_Update(delta:float):
	print(is_ready)
	enemy.velocity.y += fall_gravity * delta
	distance = enemy.global_position - player.global_position;
	
	if distance.length() < 300 and is_ready and Check_floor.is_colliding():
		print("Attacking")
		animation.play("Attack")
		is_ready= false	
		jump(delta)
		$CooldownTimer.start()


	ChangeState(is_ready, "follow"	)

		
func ChangeState(isOnCooldown: bool, stateName: String):
	if not isOnCooldown:
		#print("change state to " + stateName)
		Transitioned.emit(self, stateName)


func _on_cooldown_timer_timeout() -> void:
	is_ready = true
	print(is_ready)
	
	
func get_gravity():
	return jump_gravity if enemy.velocity.y <0.0 else fall_gravity

func jump(delta:float):
	enemy.velocity.y =jump_velocity 
	
	
		
	
