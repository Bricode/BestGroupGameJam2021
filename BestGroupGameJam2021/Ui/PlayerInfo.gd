extends Node

var health
var max_health
var charges
var max_charges
var charges_clip
var clip_size
var difficulty
var power
var max_power
var current_level
var weapon
var textevent

#var weapon = null

var mouse_sensitivity


func _ready():
	health = 100
	max_health = 100
	charges = 100
	power = 100
	max_power = 100
	max_charges = 100
	charges_clip = 100
	clip_size = 100
	difficulty = 0
	mouse_sensitivity = 0.003
	weapon = false
	textevent = " "

func change_difficulty(amount):
	difficulty = amount

func change_health(amount):
	health += amount - (difficulty * 10)
	health = clamp(health, 0, max_health)

func change_charges(amount):
	charges += amount
	charges = clamp(charges, 0, max_charges)

func change_power(amount):
	power += amount - (difficulty * 10)
	power = clamp(power, 0, max_power)

func change_max_charges(amount):
	max_charges = amount

func change_max_power(amount):
	max_power = amount

func get_health():
	return health

func get_power():
	return power

func get_charges():
	return charges

func has_charges():
	return charges > 0

func change_charges_clip(amount):
	charges_clip += amount

func has_charges_clip():
	return charges_clip > 0

func get_clip_size():
	return clip_size

#func change_weapon():
#	pass
#
#func get_weapon():
#	return weapon
func change_level():
	print("1234567")
	current_level += 1
	get_tree().change_scene("res://Levels/Level"+str(current_level)+".tscn")

func reset_level():
	current_level = 1


func change_mouse_sensitivity(amount):
	mouse_sensitivity = amount

func get_mouse_sensitivity():
	return mouse_sensitivity

#func set_textevent_get_gun():
#	textevent = "I'll show them."

func get_textevent():
	return textevent
