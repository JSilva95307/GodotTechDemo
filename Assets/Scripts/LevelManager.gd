class_name level_manager extends Node2D

var player : CharacterBody2D

#get the player to keep track of health
func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func _process(delta: float) -> void:
	pass

func Player_Death_Reset() -> void:
	get_tree().reload_current_scene()
