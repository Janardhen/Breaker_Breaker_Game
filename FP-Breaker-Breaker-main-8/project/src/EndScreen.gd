extends Node2D


func _input(_event) -> void:
	if _event.is_action_pressed('enter'):
		var _f := get_tree().change_scene("res://src/TitleScreen.tscn")
		if _f:
			pass
