class_name Hitbox extends Area2D

@export var damage = 0
@export var damage_mult = 1.0
@export var width = 10.0
@export var height = 10.0

func _init() -> void:
	#Layer for hurtbox interaction
	set_collision_layer_value(2, true)
	set_collision_mask_value(1, true)

func do_damage() -> void:
	pass
