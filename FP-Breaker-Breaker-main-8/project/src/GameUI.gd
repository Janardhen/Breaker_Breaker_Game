extends Label
# This script is a singleton to keep track of score between scenes.

var score = 0 setget set_score

func set_score(value) -> void:
	score = value
	text = "Score: " + str(score)
