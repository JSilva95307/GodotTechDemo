class_name Checkpoint extends Area2D

@export var Prompt: Sprite2D
signal entered(check: Checkpoint)
var canSave = false

var location : Vector2

func _physics_process(delta: float) -> void:
	if canSave and Input.is_action_just_pressed("Player_Interact"):
		entered.emit(self)

func _init() -> void:
	set_collision_layer_value(3, true)
	set_collision_mask_value(1, true)

func _ready() -> void:
	connect("area_entered", self._on_area_entered)
	connect("area_exited", self._on_area_exited)

func _on_area_entered(hurtbox : Hurtbox) -> void:
	if hurtbox == null:
		return
	Prompt.set_visible(true);
	canSave = true

func _on_area_exited(hurtbox : Hurtbox) -> void:
	Prompt.set_visible(false);
	canSave = false
