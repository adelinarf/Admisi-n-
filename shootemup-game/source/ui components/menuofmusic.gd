extends VBoxContainer

# This scene is used for the creation of the menu of music
# Every sub menu is creted here and then will be modified
# and use on musicmenu
signal is_pressed
signal accepted
onready var slot1=$slot1/CheckBox1
onready var slot2=$slot2/CheckBox2
onready var slot3=$slot3/CheckBox3
var button_pressed = 1 setget set_pressed
var accepted = false setget accept_button

# Every _on_CheckBox#_pressed function will help to only
# be able to select one button at the time
# And store which button is pressed

func _on_CheckBox1_pressed() -> void:
	if slot1.pressed==true:
		slot2.pressed=false
		slot3.pressed=false
		self.button_pressed=1

func _on_CheckBox2_pressed() -> void:
	if slot2.pressed==true:
		slot1.pressed=false
		slot3.pressed=false
		self.button_pressed=2

func _on_CheckBox3_pressed() -> void:
	if slot3.pressed==true:
		slot1.pressed=false
		slot2.pressed=false
		self.button_pressed=3

#This function sends a signal that says which button
#is being pressed by the user
func set_pressed(value:int)->void:
	button_pressed=value
	emit_signal("is_pressed",value)
#if the button accept is pressed is true
func _on_accept_button_up() -> void:
	self.accepted = true
# The boolean value of accept button is send in a signal
func accept_button(value:bool)->void:
	accepted=value
	emit_signal("accepted",value)
