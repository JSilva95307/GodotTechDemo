class_name weapon_base extends Node2D

#Primary Combo Hitboxes
@export var primary1 : Hitbox
@export var primary2 : Hitbox
@export var primary3 : Hitbox
#Secondary and Ability 1 + 2 Hitboxes
@export var secondary : Hitbox
@export var ability1: Hitbox
@export var ability2 : Hitbox

func _init() -> void:
	pass

func switch_p1() -> void:
	primary1.monitoring = false
