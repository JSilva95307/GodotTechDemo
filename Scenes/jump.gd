class_name Jump extends PlayerState
var can_jump = true

func Enter():
	if player.LetSpaceGo:
		if(player.jumps < player.jump_limit):
			player.LetSpaceGo = false
			can_jump = true
			await(get_tree().create_timer(player.coyote_time)).timeout
		animation_player.play("Player_Falling")
		can_jump = false
	else:
		can_jump = false
		animation_player.play("Player_Rising")
	player.jumps += 1

func Physics_Update(delta: float) -> void:
	#Coyote Time
	if can_jump and Input.is_action_just_pressed("Player_Jump") and player.jumps < player.jump_limit:
		player.velocity.y = player.JUMP_VELOCITY
	
	# Handle Jump Height
	if Input.is_action_just_released("Player_Jump") and not player.LetSpaceGo and player.velocity.y <= 0:
		player.velocity.y = 0 #get_real_velocity().y * 0.25;
		animation_player.play("Player_Falling")
		player.LetSpaceGo = true
	
	# Arial Strafing
	if player.direction > 0:
		player.Dash_Dir = Vector2(1, 0)
		player.IsFacingRight = true
	elif player.direction < 0:
		player.Dash_Dir = Vector2(-1, 0)
		player.IsFacingRight = false
	
	if not player.is_on_floor():
		if player.direction:
			player.velocity.x = player.direction * player.SPEED
		else:
			player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	
	#transitions
	if player.is_on_floor():
		player.LetSpaceGo = false
		player.jumps = 0
		Transitioned.emit(self, "idle")
	if Input.is_action_just_pressed("Player_Dash") and player.Can_Dash:
		Transitioned.emit(self, "dash")
