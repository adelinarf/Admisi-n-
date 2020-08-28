extends KinematicBody2D
signal health_changed(new_value)
signal posicion
export var speed = 300.0
export (PackedScene) var Bullet
var bullet = preload("res://source/actor/Bullet.tscn")
export var rate_fire = 0.4
var can_fire = true
var disparotriple = false
export var health = 100 setget _set_health
export var damage = 10 #lo que disminuye la barra de vida cada vez que es atacado
export var posicion_=Vector2() setget _position
func _process(delta)->void:
	shoot()
	self.posicion_=self.position   # variable to send a signal

# This function get the input from the keyboard
# Left key or A goes to the left
# Right key or D goes to the right
# Up key or W goes up
# Down key or S goes down
# Z key activate multiple shoot
# And doesn't let the player goes out of the x axis of the camera
func _physics_process(delta: float) -> void:
	var velocity = Vector2()
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	elif Input.is_action_pressed("right"):
		velocity.x += 1
	elif Input.is_action_pressed("up"):
		velocity.y -= 1
	elif Input.is_action_pressed("down"):
		velocity.y += 1
	elif Input.is_action_pressed("triple"):
		disparotriple=not disparotriple
	position.x=clamp(position.x,0,OS.get_window_size().x)
	#position.y=clamp(position.y,0,OS.get_window_size().y)
	move_and_collide(velocity*delta*speed)



#Every time the player shoots create an instance of the bullet
#Then it creates a timer to shoot one bullet after another without the need to clicking again the key
# Everytime the player shoots, the sound of player's shooting is played.
# If space or k key is played the player shoots
# If z key is activated the player can do multiple shootings
func shoot()->void:
	if Input.is_action_pressed("shoot") and can_fire==true and disparotriple==false:
		can_fire=false
		var bullet_instance = bullet.instance()
		bullet_instance.position=get_node("Position2D").get_global_position()
		get_parent().add_child(bullet_instance)
		yield(get_tree().create_timer(rate_fire),"timeout")
		can_fire=true
		if Musicchanged.attack==1:
			$bullet.play()
		elif Musicchanged.attack==2:
			$bullet2.play()
		elif Musicchanged.attack==3:
			$bullet3.play()
	elif Input.is_action_pressed("shoot") and can_fire==true and disparotriple==true:
		can_fire=false
		var bullet_instance = bullet.instance()
		var bullet_instance2 = bullet.instance()
		var bullet_instance3 = bullet.instance()
		bullet_instance.position=get_node("Position2D").get_global_position()
		bullet_instance2.position=get_node("Position2D2").get_global_position()
		bullet_instance3.position=get_node("Position2D3").get_global_position()
		get_parent().add_child(bullet_instance)
		get_parent().add_child(bullet_instance2)
		get_parent().add_child(bullet_instance3)
		yield(get_tree().create_timer(rate_fire),"timeout")
		can_fire=true
		if Musicchanged.attack==1:
			$bullet.play()
		elif Musicchanged.attack==2:
			$bullet2.play()
		elif Musicchanged.attack==3:
			$bullet3.play()
			
# Everytime something hits the players its health is decreased.
# And it plays the damage music
func _on_Bulletcollide_area_entered(area: Area2D) -> int:
	self.health-=damage
	if Musicchanged.damage==1:
		$damage.play()
	elif Musicchanged.damage==2:
		$damage2.play()
	elif Musicchanged.damage==3:
		$damage3.play()
	return health

# It emits a signal that indicate which is the health of the player
# it will be used to move the healthbar
func _set_health(new_value)->void:
	health=max(0,new_value)
	emit_signal("health_changed",health)

#It emits a signal that indicated the player position
# it will be used for the enemy's bullet to be aimed at the player
func _position(value)->void:
	posicion_=value
	emit_signal("posicion",posicion_)
	
