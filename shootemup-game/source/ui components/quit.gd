extends Button

# This button quits the game

func _on_play_button_up()->void:
	get_tree().quit()
