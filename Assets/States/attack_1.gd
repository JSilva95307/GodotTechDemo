extends PlayerState
var continueAttack = false
var nextAttack = false

func Enter():
	animation_player.play("SPrimary1")
	print_debug("attack 1 called")
	continueAttack = false
	nextAttack = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if continueAttack and Input.is_action_just_pressed("Player_Primary"):
		nextAttack = true

func finished_attack() -> void:
	if nextAttack:
		Transitioned.emit(self, "attack2")
	else: 
		Transitioned.emit(self, "Idle")

func continue_attack() -> void:
	continueAttack = true
