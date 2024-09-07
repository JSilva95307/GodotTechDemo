class_name weapon_manager extends Node2D

#save all of the weapons here for future switching and in case we want to add more weapons later
@export var weapon_list: Array[weapon_base]

#default number of hitboxes for the different weapons
	#Primary Combo
@export var active_primaryHits : Array[Hitbox]
	#Secondary and abilities 1 + 2
@export var active_secondaryHit : Hitbox
@export var active_ability1Hit : Hitbox
@export var active_ability2Hit : Hitbox

@export var starter_weapon : weapon_base
var active_weapon : weapon_base

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func switch_weapon(new_weapon : int) -> void:
	active_weapon = weapon_list[new_weapon]
	

func add_weapon(weapon : weapon_base) -> void: 
	weapon_list.append(weapon)
