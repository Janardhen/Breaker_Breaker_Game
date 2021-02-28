extends Node


func _ready() -> void:
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()


func _physics_process(_delta) -> void:
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()


func _on_TextureButton_pressed() -> void:
	var a := get_tree().change_scene("res://src/Background.tscn")
	if a:
		pass


func _on_TextureButton2_pressed() -> void:
	get_tree().quit()
