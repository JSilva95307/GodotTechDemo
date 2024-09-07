class_name Hitbox extends Area2D

@export var damage = 0
@export var damage_mult = 1.0
@export var width = 10.0
@export var height = 10.0

func _init() -> void:
	collision_layer = 2
	collision_mask = 0

func do_damage() -> void:
	pass
