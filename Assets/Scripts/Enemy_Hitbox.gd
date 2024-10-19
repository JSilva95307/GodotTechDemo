extends Hitbox
class_name enemy_hitbox

func _ready() -> void:
	set_collision_mask_value(detects.player, true)
	print_debug(detects.player)
