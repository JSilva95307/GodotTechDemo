class_name Hurtbox extends Area2D

func _init() -> void:
	#layer for checkpoint interaction
	set_collision_layer_value(3, true)
	#layer for hitbox detection
	set_collision_layer_value(1, true)
	set_collision_mask_value(2, true)

func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox : Hitbox) -> void:
	if hitbox == null:
		return
	
	if(owner.has_method("take_damage")) and hitbox.damage > 0:
		owner.take_damage(hitbox.damage)
	
	elif(owner.has_method("heal")) and hitbox.damage < 0:
		owner.heal(hitbox.damage)
