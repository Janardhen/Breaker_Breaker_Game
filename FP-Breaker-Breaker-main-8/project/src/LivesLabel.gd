extends Label
# This script is a singleton to keep track of score between scenes.

var liveslabel = 0 setget set_score

func set_score(value) -> void:
	liveslabel = value
	text =  str(liveslabel)
