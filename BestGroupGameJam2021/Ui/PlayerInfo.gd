extends Node

var health
var max_health
var charge
var max_charge
var score
var konami_code

#var weapon = null

var mouse_sensitivity


func _ready():
	health = 100
	max_health = 100
	charge = 500
	max_charge = 500
	score = 0
	mouse_sensitivity = 0.003
	konami_code = false

func set_konami_code():
	print("konami!!!!!!!!!!!!!!!")
	konami_code = true

func change_health(amount):
	health += amount
	health = clamp(health, 0, max_health)

func change_charge(amount):
	charge += amount
	charge = clamp(charge, 0, max_charge)

func change_max_charge(amount):
	max_charge = amount

func get_health():
	return health

func get_charge():
	return charge

func has_charge():
	return charge > 0

func change_mouse_sensitivity(amount):
	mouse_sensitivity = amount

func get_mouse_sensitivity():
	return mouse_sensitivity

func change_score(amount):
	score += amount

func get_score():
	return score
