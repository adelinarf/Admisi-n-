extends Control

onready var menu1=$menu/Label
onready var menu2=$menu2/Label
onready var menu3=$menu3/Label
onready var menu4=$menu4/Label
onready var menu1_accept=1
onready var menu2_accept=1
onready var menu3_accept=1
onready var menu4_accept=1

# Every submenu has its signals that indicate 
# when a button is pressed linked to this script

#Every label on the title of submenu is changed
func _ready() -> void:
	menu1.text="Background"
	menu2.text="Attack"
	menu3.text="Damage"
	menu4.text="Enemy Attack"

# According to which button is pressed
# a different music file is played
# And then the number of the music file is stored on a variable
func _on_menu_is_pressed(value:int) -> void:
	if value==1:
		$music1.playing=true
	else:
		$music1.playing=false
	if value==2:
		$music2.playing=true
	else:
		$music2.playing=false
	if value==3:
		$music3.playing=true
	else:
		$music3.playing=false
	menu1_accept=value

func _on_menu2_is_pressed(value:int) -> void:
	if value==1:
		$attack1.playing=true
	if value==2:
		$attack2.playing=true
	if value==3:
		$attack3.playing=true
	menu2_accept=value

func _on_menu3_is_pressed(value:int) -> void:
	if value==1:
		$damage1.playing=true
	if value==2:
		$damage2.playing=true
	if value==3:
		$damage3.playing=true
	menu3_accept=value

func _on_menu4_is_pressed(value:int) -> void:
	if value==1:
		$enemyattack1.playing=true
	if value==2:
		$enemyattack2.playing=true
	if value==3:
		$enemyattack3.playing=true
	menu4_accept=value

# According to the music file value stored in the 
# last functions, if the button Accept is pressed
# the music is changed globally in the game
func _on_menu_accepted(value:bool) -> void:
	if value==true:
		Musicchanged.music=menu1_accept

func _on_menu2_accepted(value:bool) -> void:
	if value==true:
		Musicchanged.music=menu2_accept

func _on_menu3_accepted(value:bool) -> void:
	if value==true:
		Musicchanged.music=menu3_accept

func _on_menu4_accepted(value:bool) -> void:
	if value==true:
		Musicchanged.music=menu4_accept
