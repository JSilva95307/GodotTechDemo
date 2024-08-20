class_name Run extends PlayerState

func Enter():
	animation_player.play("Player_Run")
	print_debug("Playing the run animation")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func Physics_Update(delta: float) ->void:
	var direction := Input.get_axis("Player_Left", "Player_Right")
	#if direction > 0:
		#Dash_Dir = Vector2(1, 0)
		#IsFacingRight = true
	#elif direction < 0:
		#Dash_Dir = Vector2(-1, 0)
		#IsFacingRight = false
	#if not IsDashing:
	if direction:
		player.velocity.x = direction * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		
	#player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
