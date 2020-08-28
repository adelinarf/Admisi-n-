extends Button

# This button restore the Score to 0 and reload the current level

func _on_retry_button_up() -> void:
	Data.score=0
	get_tree().paused=false
	get_tree().reload_current_scene()
