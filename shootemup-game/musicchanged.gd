extends Node

signal music_changed
signal attack_music_changed
signal damage_music_changed
signal enemy_music_changed

var music = 1 setget set_music
var attack= 1 setget set_attack_music
var damage= 1 setget set_damage_music
var enemy=1 setget set_enemy_music

#This functions restore the value and emit a signal
#when background, attack, damage and enemy music are changed
#This values are stored as "global variables" as musicchanged is an autoload node

func set_music(value:int)->void:
	music=value
	emit_signal("music_changed")
	
func set_attack_music(value:int)->void:
	attack=value
	emit_signal("attack_music_changed")
	
func set_damage_music(value:int)->void:
	damage=value
	emit_signal("damage_music_changed")
	
func set_enemy_music(value:int)->void:
	enemy=value
	emit_signal("enemy_music_changed")

