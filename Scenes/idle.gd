class_name Idle extends PlayerState

func Enter():
	animation_player.play("Player_Idle")
	print_debug("Playing the idle animation")

func Physics_Update(delta: float) -> void:
	if not player.is_on_floor():
		print_debug("transition to falling state")
	
	if Input.is_action_just_pressed("Player_Left") or Input.is_action_just_pressed("Player_Right"):
		Transitioned.emit(self, "run")
