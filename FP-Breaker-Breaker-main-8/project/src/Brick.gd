extends StaticBody2D

onready var ScoreLabel = $"/root/Background/ScoreLabel"



func _ready() -> void:
	var _time := rand_range(0.0, 1.0)
	yield(get_tree().create_timer(_time), "timeout")
	self.visible = true


func hit() -> void:
	ScoreLabel.score += ($"/root/Background".level + 1)
	randomize()
	var _range = randi() % 3
	var powerup = load("res://src/PowerUp.tscn").instance()
	powerup.position = global_position
	if _range == 0:
		yield(get_tree(), "idle_frame")
		get_node("/root/Background/PowerUps").add_child(powerup, true)
	queue_free()
