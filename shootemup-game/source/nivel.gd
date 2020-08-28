extends Node2D

onready var healthbar = $CanvasLayer/Bar2/TextureProgress
onready var player = $Player
onready var enemy = $enemy2
onready var camera = $Camera2D
onready var pause_menu=$CanvasLayer/UserPause
onready var pause_title=$CanvasLayer/UserPause/ColorRect/Label2

# On ready we set the healthbar value to 100
# The background music is changed according to the value
# that musicchanged has

func _ready() -> void:
	healthbar.value=100
	#camera.limit_left=0
	#camera.limit_right=OS.get_window_size().x
	if Musicchanged.music==1:
		$sonidodebackground.playing=true
		$background2.playing=false
		$background3.playing=false
	elif Musicchanged.music==2:
		$background2.playing=true
		$background3.playing=false
		$sonidodebackground.playing=false
	elif Musicchanged.music==3:
		$background3.playing=true
		$background2.playing=false
		$sonidodebackground.playing=false

# Process limits the y position of the player
# The player can't go further away than the camera

func _process(delta: float) -> void:
	player.position.y=clamp(player.position.y,0+camera.position.y-(128+42),OS.get_window_size().y-(128*2)+camera.position.y)

# Everytime the player is hit by an enemy bullet
# it sends a signal, the nivel script get it and 
# decrease the value of the healthbar
# If this value is 0 it means the player dies, so the 
# pauses and you can start again or quit
func _on_Player_health_changed(new_value:int) -> void:
	healthbar.value = new_value
	if healthbar.value==0:
		pause_menu.pause=true
		pause_title.text="You died"


		


