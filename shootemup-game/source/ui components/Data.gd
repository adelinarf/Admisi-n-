extends Node

signal score_update

var score = 0 setget set_score

# This script store the score value as a global variable
# that can be reach at any time and emit a signal
#func reset()->void:
	#score=0

func set_score(value:int)->void:
	score=value
	emit_signal("score_update")
	
