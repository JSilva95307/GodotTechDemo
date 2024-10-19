extends Hitbox
class_name player_hitbox
func _ready() -> void:
	set_collision_mask_value(detects.enemy, true)
