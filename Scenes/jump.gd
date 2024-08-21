class_name Jump extends PlayerState

func Enter():
	if player.LetSpaceGo:
		animation_player.play("Player_Falling")
	else:
		animation_player.play("Player_Rising")

func Physics_Update(delta: float) -> void:
	# Arial Strafing
	var direction := Input.get_axis("Player_Left", "Player_Right")
	if direction > 0:
		player.Dash_Dir = Vector2(1, 0)
		player.IsFacingRight = true
	elif direction < 0:
		player.Dash_Dir = Vector2(-1, 0)
		player.IsFacingRight = false
	if not player.is_on_floor():
		if direction:
			player.velocity.x = direction * player.SPEED
		else:
			player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	# Handle Jump Height
	if Input.is_action_just_released("Player_Jump") and not player.LetSpaceGo and player.velocity.y <= 0:
		player.velocity.y = 0 #get_real_velocity().y * 0.25;
		animation_player.play("Player_Falling")
		player.LetSpaceGo = true
	
	#transitions
	if player.is_on_floor():
		player.LetSpaceGo = false
		Transitioned.emit(self, "idle")
	if Input.is_action_just_pressed("Player_Dash") and player.Can_Dash:
		Transitioned.emit(self, "dash")
