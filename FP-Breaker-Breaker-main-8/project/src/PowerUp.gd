extends Node2D


var powers := [ "Duplicate", "IncreaseLife","fast_paddle","long_paddle"]
var speed = 80
var _pow : int
var _texture : StreamTexture

func _ready():
	randomize()
	_pow = randi() % powers.size()
	$TextureRect.texture = load("res://assets/PowerUps/%s.png" % powers[_pow])

func _physics_process(delta):
	position.y += speed * delta



func _on_Area2D_area_entered(area):
	if area == get_node("/root/Background/Border/Bottom"):
		print("Bottom")
		queue_free()


func _on_Area2D_body_entered(body):
	if body == get_node("/root/Background/Paddle"):
		print("Paddle")
		get_node("/root/Background").power_up(powers[_pow])
		queue_free()
