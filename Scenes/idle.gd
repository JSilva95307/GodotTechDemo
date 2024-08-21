class_name Idle extends PlayerState

func Enter():
	animation_player.play("Player_Idle")

func Physics_Update(delta: float) -> void:
	if not player.is_on_floor() :
		player.LetSpaceGo = true
		Transitioned.emit(self, "jump")
	if Input.is_action_just_pressed("Player_Jump"):
		player.velocity.y = player.JUMP_VELOCITY
		Transitioned.emit(self, "jump")
	#
	## Handle Jump Height
	#if Input.is_action_just_released("Player_Jump") and not LetSpaceGo and velocity.y <= 0:
		#velocity.y = 0 #get_real_velocity().y * 0.25;
		#LetSpaceGo = true
	if Input.is_action_pressed("Player_Left") or Input.is_action_pressed("Player_Right"):
		Transitioned.emit(self, "run")
	if Input.is_action_just_pressed("Player_Dash") and player.Can_Dash:
		Transitioned.emit(self, "dash")
