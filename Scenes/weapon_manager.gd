class_name weapon_manager extends Node2D

#save all of the weapons here for future switching and in case we want to add more weapons later
@export var weapon_list: Array[weapon_base]

#default number of hitboxes for the different weapons
	#Primary Combo
var active_primary1 : Hitbox
var active_primary2 : Hitbox
var active_primary3 : Hitbox
	#Secondary and abilities 1 + 2
var active_secondaryHit : Hitbox
var active_ability1Hit : Hitbox
var active_ability2Hit : Hitbox

@export var starter_weapon : weapon_base
var active_weapon : weapon_base

func _ready() -> void:
	active_weapon = starter_weapon

func _process(delta: float) -> void:
	pass

func switch_weapon(new_weapon : int) -> void:
	active_weapon = weapon_list[new_weapon]

func add_weapon(weapon : weapon_base) -> void: 
	weapon_list.append(weapon)
