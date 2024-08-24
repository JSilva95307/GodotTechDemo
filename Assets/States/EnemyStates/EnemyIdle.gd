extends State
class_name  EnemyIdle

@export var enemy : CharacterBody2D
@export var move_speed := 5000
@export var animation : AnimationPlayer
@export var check_floor: RayCast2D
@export var check_wall : RayCast2D

var player : CharacterBody2D
var move_direction : Vector2


#wander in a random direction for a random time
func wander():
		#chekc if there is a floor if there is change direction
	if move_direction.x >0:
		check_floor.position.x =75
		if not check_floor.is_colliding() or check_wall.is_colliding() :
			move_direction.x = -1
			check_floor.position.x =-75
			check_wall.position.x = -75
			check_wall.rotation = deg_to_rad(-180)
	elif move_direction.x <0:
		check_floor.position.x =-75
		if not check_floor.is_colliding() or check_wall.is_colliding() :
			move_direction.x = 1
			check_floor.position.x =75
			check_wall.position.x = 75
			check_wall.rotation = 0
	
#enter idle state
func Enter():
	#testing change state
	move_direction.x =1
	animation.play("Idle")
	player = get_tree().get_first_node_in_group("Player")
	wander()

func Update(_delta: float):
		wander()


func Physics_Update(_delta : float):
	#update the wander to move the character
	if enemy:
		enemy.velocity = move_direction * move_speed * _delta
		var direction = player.global_position - enemy.global_position
		#check to see if it needs to change state
		if direction.length() < 300:
			Transitioned.emit(self, "follow")
