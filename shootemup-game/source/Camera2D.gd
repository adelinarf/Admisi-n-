extends Camera2D
var speed=100

# This script let the camera move by itself 
# and it only can reach to 1500 which is the end of the level
func _physics_process(delta: float) -> void:
	position -= transform.y*speed*delta
	self.get_canvas_transform() 
	self.limit_top=-1500
