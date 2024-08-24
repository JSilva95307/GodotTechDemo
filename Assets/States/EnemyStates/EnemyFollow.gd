extends State
class_name  EnemyFollow

@export var enemy : CharacterBody2D
@export var move_speed := 50
@export var animation : AnimationPlayer

var player : CharacterBody2D
var distance : Vector2

func Enter():
	#check to see if state is following
	print("follow")
	animation.play("run")
	player = get_tree().get_first_node_in_group("Player")
	
func Physics_Update(delta:float):
	#check the direction the enemy needs to move
	var direction = player.global_position.x - enemy.global_position.x
	#check the distance from the player
	distance = player.global_position - enemy.global_position
	#how far away before stopping 
	if distance.length() > 50:
		#set the velocity
		enemy.velocity.x = direction * move_speed * delta
	else:
		#slow down once reaching the player
		enemy.velocity = Vector2()
	
	ChangeState(800,"idle")
	if distance.length()  < 300:
		#print("change state to " + stateName)
		Transitioned.emit(self, "attack")
	
func ChangeState(length: int, stateName: String):
	if distance.length()  > length:
		#print("change state to " + stateName)
		Transitioned.emit(self, stateName)
		
