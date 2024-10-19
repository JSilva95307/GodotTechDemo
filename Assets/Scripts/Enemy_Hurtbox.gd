extends Hurtbox
class_name enemy_hurtbox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_collision_mask_value(detected_by.player, true)
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox : player_hitbox) -> void:
	if hitbox == null:
		return
	
	if(owner.has_method("take_damage")) and hitbox.damage > 0:
		owner.take_damage(hitbox.damage)
