extends Popup

var my_scene = load("res://src/Background.tscn").instance()


func _draw() -> void:
	var r = Rect2($CenterContainer.rect_position,$CenterContainer.rect_size)
	draw_rect(r,Color(1,1,1,.5))


func _input(event) -> void:
	print (my_scene.get_class())
	if event.is_action("ui_cancel")  : 
		get_tree().set_input_as_handled()
		_on_btn_continue_pressed()


func _on_btn_quit_pressed() -> void:
	get_tree().paused = false
	var a := get_tree().change_scene_to(my_scene)
	if a:
		pass


func _on_btn_continue_pressed() -> void:
	var response = {"message":"Continue"}
	if my_scene.has_method("close_dialog"):
		my_scene.close_dialog(self,response)
