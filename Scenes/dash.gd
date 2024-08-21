class_name dash extends PlayerState

func Enter():
	animation_player.play("Player_Dash")
	StartDash()

func StartDash() -> void:	
	# Set dashing and invulnurability
	player.IsDashing = true
	player.IsInvul = true
	# Half the distance for AirDashing
	if not player.is_on_floor():
		player.velocity = player.Dash_Dir.normalized() * (player.DASH_SPEED * 0.75)
	else:
		player.velocity = player.Dash_Dir.normalized() * player.DASH_SPEED
	await(get_tree().create_timer(player.DASH_TIME)).timeout
	EndDash()

func EndDash() -> void:
	# Reset bools and vars
	player.velocity = Vector2(0, 0);
	player.IsDashing = false
	player.IsInvul = false
	player.StartDashCD()
	if not player.is_on_floor() :
		player.LetSpaceGo = true
		Transitioned.emit(self, "jump")
	elif player.is_on_floor() :
		Transitioned.emit(self, "idle")
