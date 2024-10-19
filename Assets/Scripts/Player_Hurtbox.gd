extends Hurtbox
class_name player_hurtbox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_collision_layer_value(detected_by.enemy, true)
	set_collision_layer_value(detected_by.checkpoint, true)
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox : enemy_hitbox) -> void:
	if hitbox == null:
		return
	
	if(owner.has_method("take_damage")) and hitbox.damage > 0:
		owner.take_damage(hitbox.damage)
	
	elif(owner.has_method("heal")) and hitbox.damage < 0:
		owner.heal(hitbox.damage)
