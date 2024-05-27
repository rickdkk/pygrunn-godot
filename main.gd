extends Node

@export var eierbal_scene: PackedScene

var score: int = 0 :
	set(value):
		score = value
		score_label.text = str(score).lpad(4)
var speed_multiplier: float = 1

@onready var score_label: Label = $ScoreLabel
@onready var eierballen_container: Node = $Eierballen
@onready var timer: Timer = $Timer


func _on_timer_timeout() -> void:
	var new_eierbal := eierbal_scene.instantiate() as Eierbal
	eierballen_container.add_child(new_eierbal)

	new_eierbal.eierbal_caught.connect(_on_eierbal_caught)
	new_eierbal.position.x = randf_range(0, get_viewport().get_visible_rect().size.x)
	new_eierbal.speed *= speed_multiplier

	timer.wait_time = clamp(timer.wait_time - 0.05, 0.5, 1)
	speed_multiplier = clamp(speed_multiplier + 0.05, 1, 1.5)


func _on_eierbal_caught() -> void:
	score += 1
