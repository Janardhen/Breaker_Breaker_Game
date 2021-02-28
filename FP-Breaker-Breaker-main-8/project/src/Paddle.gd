extends KinematicBody2D

onready var  _SPEED := 5.0


func _physics_process(_delta) -> void:
	var _collision_info : KinematicCollision2D
	
	if Input.is_action_pressed("go_left"):
		_collision_info = move_and_collide(Vector2(-_SPEED, 0))
	elif Input.is_action_pressed("go_right"):
		_collision_info = move_and_collide(Vector2(_SPEED, 0))
	
	if _collision_info:
		pass
