class_name PlayerState	extends State

@export var player : Player
@export var animation_player: AnimationPlayer

func _ready():
	await owner.ready
	player = owner as Player
	assert(player != null, "the Playerstate class should only be used in the player scene. It needs the player
	to be the owner to function.")
