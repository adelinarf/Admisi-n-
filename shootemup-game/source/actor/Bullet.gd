extends Area2D

export var speed = 100

# The player's bullet is moved upwards
func _physics_process(delta: float) -> void:
	position -= transform.y*speed*delta

# If the bullet hits a body is deleted from the scene
func _on_Bullet_body_entered(body: Area2D) -> void:
	#if body.is_in_group("world"):   
	queue_free()       

