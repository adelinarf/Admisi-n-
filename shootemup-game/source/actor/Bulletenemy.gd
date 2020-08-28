extends Area2D

export var speed = 100
export var damage=10
export var health=100
var trajectory

#set the trajectory of the bullet
func init(v):
	trajectory=v

# Let the enemy's bullet move according to the player position
func _physics_process(delta: float) -> void:
	position += trajectory*speed*delta
	#position += transform.y*speed*delta

# If it hits the player or a object from the world, it disappears
func _on_Bulletenemy_body_entered(body: Node) -> void:
	if body.is_in_group("player") or body.is_in_group("world"):   #If it collides with any of the objects in those groups
		queue_free()
		
