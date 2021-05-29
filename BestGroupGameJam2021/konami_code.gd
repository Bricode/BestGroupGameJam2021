extends Node

var counter

var up = 0
var down = 0
var left = 0
var right = 0
var b = 0
var a = 0

func _process(delta):
	#print(counter)
	if Input.is_action_just_pressed("ui_up"):
		up += 1
	if Input.is_action_just_pressed("ui_down") and up == 2:
		down += 1
		print("yes")
	elif Input.is_action_just_pressed("ui_down") and up != 2:
		up = 0
		down = 0
		left = 0
		right = 0
		b = 0
		a = 0
	if Input.is_action_just_pressed("ui_left") and up == 2 and down == 2:
		left += 1
	elif Input.is_action_just_pressed("ui_left"):
		up = 0
		down = 0
		left = 0
		right = 0
		b = 0
		a = 0
	if Input.is_action_just_pressed("ui_right") and up == 2 and down == 2:
		right += 1
		print("yes2")
	elif Input.is_action_just_pressed("ui_right"):
		up = 0
		down = 0
		left = 0
		right = 0
		b = 0
		a = 0
	if Input.is_action_just_pressed("b") and up == 2 and down == 2 and left == 2 and right == 2:
		b += 1
		print("yes3")
	elif Input.is_action_just_pressed("b"):
		up = 0
		down = 0
		left = 0
		right = 0
		b = 0
		a = 0
	if Input.is_action_just_pressed("move_left") and up == 2 and down == 2 and left == 2 and right == 2 and b == 1:
		a += 1
		print("yes2")
	elif Input.is_action_just_pressed("move_left"):
		up = 0
		down = 0
		left = 0
		right = 0
		b = 0
		a = 0
	if a == 1:
		PlayerInfo.set_konami_code()
		up = 0
		down = 0
		left = 0
		right = 0
		b = 0
		a = 0

