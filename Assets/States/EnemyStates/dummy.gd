extends CharacterBody2D
class_name dummy

func _physics_process(delta: float) -> void:
	pass

func take_damage(damage: float) -> void:
	print_debug( "enemy " + str(damage) + " damage taken!")
