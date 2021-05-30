extends KinematicBody

var enemy_list = ["res://Enemy/Enemy.tscn"]

export var speed = 400
export var acceleration = 150
export var gravity = 500
export var jump_power = 10000
export var mouse_sensitivity = 0.3

onready var head = $Head
onready var camera = $Head/Camera

var velocity = Vector3()
var camera_x_rotation = 0
var current_health = PlayerInfo.health

var trauma = 0.0
var decay = 0.8
var trauma_power = 2
var max_offset = Vector2(0.75,0.75)

func _ready():
	randomize()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))

		var x_delta = event.relative.y * mouse_sensitivity
		if camera_x_rotation + x_delta > -90 and camera_x_rotation + x_delta < 90: 
			camera.rotate_x(deg2rad(-x_delta))
			camera_x_rotation += x_delta
		
func _physics_process(delta):
	var head_basis = head.get_global_transform().basis
	
	if Input.is_action_pressed("sprint"):
		acceleration = 100
	else:
		acceleration = 50
	
	var direction = Vector3()
	if Input.is_action_pressed("move_forward"):
		direction -= head_basis.z
	elif Input.is_action_pressed("move_backward"):
		direction += head_basis.z
	
	if Input.is_action_pressed("move_left"):
		direction -= head_basis.x
	elif Input.is_action_pressed("move_right"):
		direction += head_basis.x
	
	direction = direction.normalized()
	
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity.y -= gravity
	
	#if Input.is_action_just_pressed("jump") and is_on_floor():
	#	velocity.y += jump_power
	
	velocity = move_and_slide(velocity * delta, Vector3.UP)
	
func _process(delta):
	

	if Input.is_action_pressed("primary_fire") and PlayerInfo.score >= 20100:
		if PlayerInfo.charge >= 1:
			$LazerSound.play()
			PlayerInfo.change_charge(-10)
			$LazerSound.play()
			var lazer = load("res://Player/LaserMesh.tscn").instance()
			lazer.move = -($Head/Camera.global_transform.origin-$Head/Camera/Spatial.global_transform.origin).normalized()
			lazer.look_at(lazer.move,Vector3.UP)
			lazer.translation = global_transform.origin + Vector3(0,0.5,0)
			get_parent().get_node("Lazers").add_child(lazer)
	elif Input.is_action_just_pressed("primary_fire"):		
		if PlayerInfo.charge >= 10:
			$LazerSound.play()
			PlayerInfo.change_charge(-10)
			$LazerSound.play()
			create_lazer(global_transform.origin + Vector3(0,0.5,0),-($Head/Camera.global_transform.origin-$Head/Camera/Spatial.global_transform.origin).normalized())
			if PlayerInfo.score >= 1100:
				create_lazer(global_transform.origin - Vector3(0,0.5,0),-($Head/Camera.global_transform.origin-$Head/Camera/Spatial.global_transform.origin).normalized())
				if PlayerInfo.score >= 5100:
					create_lazer(global_transform.origin + Vector3(0,1.5,0),-($Head/Camera.global_transform.origin-$Head/Camera/Spatial.global_transform.origin).normalized())
					if PlayerInfo.score >= 10100:
						create_lazer(global_transform.origin - Vector3(0,1.5,0),-($Head/Camera.global_transform.origin-$Head/Camera/Spatial.global_transform.origin).normalized())
	
	if PlayerInfo.konami_code:
		PlayerInfo.score += 100
		PlayerInfo.charge = 500
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()

func hit(number):
	trauma = 1
	$HitSound.play()
	PlayerInfo.change_health(number)
	if PlayerInfo.health <= 0:
		get_tree().change_scene("res://Ui/DeathScreen/DeathScreen.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func shake():
	var amount = pow(trauma, trauma_power)
	$Head/Camera.h_offset = max_offset.x * amount * rand_range(-1, 1)
	$Head/Camera.v_offset = max_offset.y * amount * rand_range(-1, 1)

func create_lazer(pos,dir):
	var lazer = load("res://Player/LaserMesh.tscn").instance()
	lazer.move = dir
	lazer.look_at(dir,Vector3.UP)
	lazer.translation = pos
	get_parent().get_node("Lazers").add_child(lazer)
