extends Button

export (String, FILE) var next_scene := "" 
onready var scene_tree:= get_tree()

# When the game is not pause this button can change the scene
# Into a loaded file in the inspector

func _on_play_button_up() -> void:
	scene_tree.paused=false
	get_tree().change_scene(next_scene)
