class_name Run extends PlayerState

func Enter():
	animation_player.play("Player_Run")

func Physics_Update(delta: float) ->void:
	var direction := Input.get_axis("Player_Left", "Player_Right")
	if direction > 0:
		player.Dash_Dir = Vector2(1, 0)
		player.IsFacingRight = true
	elif direction < 0:
		player.Dash_Dir = Vector2(-1, 0)
		player.IsFacingRight = false
	if direction:
		player.velocity.x = direction * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	
	#transitions
	if not player.is_on_floor() :
		player.LetSpaceGo = true
		Transitioned.emit(self, "jump")
	if Input.is_action_just_pressed("Player_Jump"):
		player.velocity.y = player.JUMP_VELOCITY
		Transitioned.emit(self, "jump")
	if(direction == 0):
		Transitioned.emit(self, "idle")
	if Input.is_action_just_pressed("Player_Dash") and player.Can_Dash:
		Transitioned.emit(self, "dash")
