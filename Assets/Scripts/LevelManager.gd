class_name level_manager extends Node2D

@export var cur_checkpoint: Checkpoint
@export var checkpoints: Array[Checkpoint]
var respawn_point: Vector2
var player : CharacterBody2D

#get the player to keep track of health
func _ready() -> void:
	print("Player Found")
	player = get_tree().get_first_node_in_group("Player")
	#connect all of the Checkpoints to the Set Respawn point function
	for checkpoint in checkpoints:
		checkpoint.entered.connect(Set_Cur_Checkpoint)
	
	respawn_point = cur_checkpoint.position
	player.position = respawn_point

func Player_Death_Reset() -> void:
	player.position = respawn_point

func Set_Cur_Checkpoint(new_checkpoint: Checkpoint) -> void:
	cur_checkpoint = new_checkpoint
	respawn_point = new_checkpoint.position
