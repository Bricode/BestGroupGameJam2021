extends Node

var health
var max_health
var charge
var max_charge
var charge_clip
var clip_size
var difficulty
var power
var max_power
var current_level
var weapon
var textevent
var score

#var weapon = null

var mouse_sensitivity


func _ready():
	health = 100
	max_health = 100
	charge = 100
	power = 100
	max_power = 100
	max_charge = 100
	score = 0
	#charge_clip = 1
	#clip_size = 1
	difficulty = 0
	mouse_sensitivity = 0.003
	weapon = false
	textevent = " "

func change_difficulty(amount):
	difficulty = amount

func change_health(amount):
	health += amount - (difficulty * 10)
	health = clamp(health, 0, max_health)

func change_charge(amount):
	charge += amount
	charge = clamp(charge, 0, max_charge)

func change_power(amount):
	#power += amount - (difficulty * 10)
	#power = clamp(power, 0, max_power)
	pass

func change_max_charge(amount):
	max_charge = amount

func change_max_power(amount):
	max_power = amount

func get_health():
	return health

func get_power():
	return power

func get_charge():
	return charge

func has_charge():
	return charge > 0

func change_charge_clip(amount):
	charge_clip += amount

func has_charge_clip():
	return charge_clip > 0

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

func change_score(amount):
	score += amount

func get_score():
	return score
