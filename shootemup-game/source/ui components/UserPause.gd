extends Control

var pause:= false setget set_pause
onready var scene_tree:= get_tree()
onready var pause_menu:= $ColorRect
onready var score: Label = $Label

# Connect the score_update from autoload Data with updateinterface
# that shows the user its score
func _ready() -> void:
	Data.connect("score_update",self, "updateinterface")
	updateinterface()
# When the p key is selected the game is paused 
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		$pausesound.play()
		self.pause= not pause
		scene_tree.set_input_as_handled()  #doesn't let input being handled as it is paused

# Shows the user the score
func updateinterface()->void:
	score.text= "Score: %s" % Data.score
# Sends a signal that says if the game is paused
# Pause it and makes the pause menu visible
func set_pause(value:bool)->void:
	pause=value
	scene_tree.paused=value
	pause_menu.visible=value
