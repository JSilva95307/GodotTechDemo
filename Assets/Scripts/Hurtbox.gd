class_name Hurtbox extends Area2D

@export var Health = 20

func _init() -> void:
	collision_layer = 0
	collision_mask = 2

func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox : Hitbox) -> void:
	if hitbox == null:
		return
	
	if(owner.has_method("take_damage")) and hitbox.damage > 0:
		owner.take_damage(hitbox.damage)
	
	elif(owner.has_method("heal")) and hitbox.damage < 0:
		owner.heal(hitbox.damage)
