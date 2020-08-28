extends Area2D

export (String, FILE) var next_scene := "" 

# When the player touches the portal sprite it can 
# change to another scene which can be the endscreen
# or another level

func _on_portal_body_entered(body: Node) -> void:
	get_tree().change_scene(next_scene)
