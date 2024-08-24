extends CharacterBody2D
class_name Slime


func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta*20
	move_and_slide()

	if velocity.x >0:
		$Sprite2D.flip_h =false
	else:
		$Sprite2D.flip_h =true
