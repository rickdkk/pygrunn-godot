class_name Eierbal
extends Area2D

signal eierbal_caught

@export var speed: float = 200


func _ready() -> void:
	rotation_degrees = randi_range(0, 360)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta

	if position.y > get_viewport().get_visible_rect().size.y:
		get_tree().reload_current_scene()


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		eierbal_caught.emit()
		queue_free()
