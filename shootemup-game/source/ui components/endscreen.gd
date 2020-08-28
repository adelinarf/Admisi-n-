extends Control

onready var label= $Label2

# This script set the label text as the text already 
# written on it, plus the value of the score stored on the autoload Data

func _ready() -> void:
	label.text = label.text % Data.score
