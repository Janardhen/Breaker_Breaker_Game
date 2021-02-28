extends Node2D

const _BALL_VELOCITY := Vector2(100.0, 300.0)
export (int) var level := 0
export (int) var lives := 3
export (int) var bricks_broken := 0
export (int) var num_balls := 0
var ball_res = preload("res://src/Ball.tscn")
onready var LivesLabel = $"/root/Background/LivesLabel"
var PaddleCollision = null
var PaddleSprite = null
var PaddleKB = null


func spawn_ball() -> void:
	num_balls += 1
	var Ball = ball_res.instance()
	Ball.linear_velocity = Vector2.ZERO
	Ball.position = Vector2(200.0, 400.0)
	call_deferred("add_child", Ball)
	yield(get_tree().create_timer(1.0), "timeout")
	if Ball != null:
		Ball.linear_velocity = _BALL_VELOCITY * (1.0 + level/10.0)


func spawn_bricks() -> void:
	$Hammering.play()
	for row in range(6):
		for column in range(6):
			var brick_model : PackedScene = load("res://src/Brick.tscn")
			var brick : StaticBody2D = brick_model.instance()
			brick.position = Vector2(column*65+40, row*30+22.5)
			brick.get_node("Sprite").frame = row
			$BrickContainer.add_child(brick)


func _setup_level() -> void:
	bricks_broken = 0
	$Paddle.position = Vector2(200, 470)
	spawn_bricks()
	spawn_ball()


func _ready() -> void:
	randomize()
	level = 0
	_setup_level()
	set_process_input(true)
	$SoundTrack.play()
	PaddleSprite = get_tree().get_nodes_in_group("PaddleSprite")[0]
	PaddleKB = get_tree().get_nodes_in_group("PaddleKB")[0]
	PaddleCollision = get_tree().get_nodes_in_group("PaddleCollision")[0]


func _input(event) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().set_input_as_handled()
		$Popup.popup()
		get_tree().paused = true


func close_dialog(dialog,response) -> void:
	dialog.queue_free()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().paused = false
	set_process_input(true) 
	if response.message == "Continue":
		pass 


func _on_btn_quit_pressed() -> void:
	get_tree().paused = false
	var _b := get_tree().change_scene("res://src/TitleScreen.tscn")
	if _b:
		pass


func _on_btn_continue_pressed() -> void:
	get_tree().paused = false
	$Popup.hide()


func power_up(_pow : String):
	match _pow:
		"Duplicate":
			spawn_ball()
		"IncreaseLife":
			lives += 1
			LivesLabel.liveslabel =  lives
		"long_paddle":
			PaddleCollision.global_scale.x = 2
			PaddleSprite.global_scale.x = 2
		"fast_paddle":
			PaddleKB._SPEED = PaddleKB._SPEED * 2.0
