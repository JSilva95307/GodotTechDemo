class_name Checkpoint extends Area2D

signal entered(check: Checkpoint)

var location : Vector2

func _init() -> void:
	set_collision_layer_value(1, true)
	set_collision_mask_value(3, true)

func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hurtbox : Hurtbox) -> void:
	if hurtbox == null:
		return
	entered.emit(self)
