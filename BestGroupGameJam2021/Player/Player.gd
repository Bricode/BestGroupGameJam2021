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
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))

		var x_delta = event.relative.y * mouse_sensitivity
		if camera_x_rotation + x_delta > -90 and camera_x_rotation + x_delta < 90: 
			camera.rotate_x(deg2rad(-x_delta))
			camera_x_rotation += x_delta

func _process(delta):
	if (current_health > PlayerInfo.health):
		$HitSound.play()
		
func _physics_process(delta):
	var head_basis = head.get_global_transform().basis
	
	if Input.is_action_pressed("sprint"):
		acceleration = 250
	else:
		acceleration = 150
	
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
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump_power
	
	velocity = move_and_slide(velocity * delta, Vector3.UP)
	
	if Input.is_action_just_pressed("primary_fire"):
		$LazerSound.play()
		if PlayerInfo.charge >= 10:
			PlayerInfo.change_charge(-10)
			var lazer = load("res://Player/LaserMesh.tscn").instance()
			lazer.move = -($Head/Camera.global_transform.origin-$Head/Camera/Spatial.global_transform.origin).normalized()
			lazer.look_at(lazer.move,Vector3.UP)
			lazer.translation = global_transform.origin + Vector3(0,0.5,0)
			get_parent().get_node("Lazers").add_child(lazer)
			if PlayerInfo.score >= 1100:
				lazer = load("res://Player/LaserMesh.tscn").instance()
				lazer.move = -($Head/Camera.global_transform.origin-$Head/Camera/Spatial.global_transform.origin).normalized()
				lazer.look_at(lazer.move,Vector3.UP)
				lazer.translation = global_transform.origin- Vector3(0,0.5,0)
				get_parent().get_node("Lazers").add_child(lazer)
				if PlayerInfo.score >= 5100:
					lazer = load("res://Player/LaserMesh.tscn").instance()
					lazer.move = -($Head/Camera.global_transform.origin-$Head/Camera/Spatial.global_transform.origin).normalized()
					lazer.look_at(lazer.move,Vector3.UP)
					lazer.translation = global_transform.origin + Vector3(0,1.5,0)
					get_parent().get_node("Lazers").add_child(lazer)
					if PlayerInfo.score >= 10100:
						lazer = load("res://Player/LaserMesh.tscn").instance()
						lazer.move = -($Head/Camera.global_transform.origin-$Head/Camera/Spatial.global_transform.origin).normalized()
						lazer.look_at(lazer.move,Vector3.UP)
						lazer.translation = global_transform.origin- Vector3(0,1.5,0)
						get_parent().get_node("Lazers").add_child(lazer)
	
	if PlayerInfo.konami_code:
		PlayerInfo.score += 10
		PlayerInfo.charge = 100

