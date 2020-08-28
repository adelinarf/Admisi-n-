extends KinematicBody2D

export var speed = 20
export (PackedScene) var Bulletenemy
var bullet = preload("res://source/actor/Bulletenemy.tscn")
export var rate_fire = 0.3
var can_fire = true
export var health_enemy=4
export (PackedScene) var Player
var player_ = load("res://source/actor/Player.tscn") # load scene from file
var player = player_.instance()
export var movimiento = 1
var number=0
export var frecuencia = 0.1
export var amplitud = 1
export var vel = Vector2(-1,0)
export var score_=100
var player1=Vector2()
onready var TweenNode = get_node("Tween")
var array=[Vector2(100,0),Vector2(0,100),Vector2(-100,0),Vector2(0,-100)]
var animacion=true

func _process(delta:float) -> void:
	shoot()

# Movement 1: Goes on a rect line downwards
# Movement 2: Goes from side to side of the screen
# Movement 3: Moves like a sin function
# Movement 4: Follows a set of points give a an array
func _physics_process(delta: float) -> void:
	var velocity = Vector2()
	if movimiento==1:
		velocity.y += 1
		move_and_collide(velocity*delta*speed)
	elif movimiento==2:
		if self.position.x<=0:
			vel.x=-vel.x
		if self.position.x>=OS.get_window_size().x:
			vel.x=-vel.x	
		move_and_collide(vel*delta*speed)
	elif movimiento==3:
		number+=1
		velocity.x=amplitud*sin(number*frecuencia)
		velocity.y+=1
		move_and_collide(velocity*delta*speed)
	elif movimiento==4:
		if animacion==true:
			animacion=false
			animar()

func animar()->void:
	for i in range(0,len(array)):
		TweenNode.interpolate_property(self,"position", get_position(), get_position()+array[i],1.0,Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
		TweenNode.start()
		yield(TweenNode, "tween_completed")
	animar()
	
# The player sends its actual position in a signal
func _on_Player_posicion(new_value:Vector2) -> void:
	player.position=new_value

#Every time the enemy shoots create an instance of the bullet
# Get the vector between the enemy and the player with v
# And use it to give the trajectory of a given bullet
#Then it creates a timer to shoot one bullet after another
# Everytime the enemy shoots, the sound of enemy's shooting is played.
func shoot()->void:
	if can_fire==true:
		can_fire=false
		var bullet_instance = bullet.instance()
		bullet_instance.position=get_node("Position2D").get_global_position()
		var v = (player.position - self.position)/500
		bullet_instance.init(v)
		get_parent().add_child(bullet_instance)
		yield(get_tree().create_timer(rate_fire),"timeout")
		can_fire=true
		if Musicchanged.enemy==1:
			$bulletenemy.play()
		elif Musicchanged.enemy==2:
			$bulletenemy2.play()
		elif Musicchanged.enemy==3:
			$bulletenemy3.play()
	else:
		pass

# When a player's bullet hit the area of the enemy
# Its health goes down and when it is 0 the enemy is eliminated
func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		health_enemy-=1
		Data.score+=score_
		if health_enemy==0:
			queue_free()

