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
	#primary1.disabled = true
	#primary2.disabled = true
	#primary3.disabled = true
	#secondary.disabled = true
	#ability1.disabled = true
	#ability2.disabled = true
