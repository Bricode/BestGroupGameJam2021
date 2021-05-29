extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent().get_parent().get_node("Player")
var speed = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	var move = Vector3(0,0,0)
	look_at(player.global_transform.origin, Vector3.UP)
	rotation_degrees.x = 0
	var direction = -player.transform.origin.direction_to(transform.origin) *speed
	var player_vec3 = player.transform.origin
	var enemy_vec3 = transform.origin
	if Vector2(player_vec3.x,player_vec3.z).distance_to(Vector2(enemy_vec3.x,enemy_vec3.z)) <= 10:
		speed = 500
	elif Vector2(player_vec3.x,player_vec3.z).distance_to(Vector2(enemy_vec3.x,enemy_vec3.z)) > 10:
		speed = 300
	if Vector2(player_vec3.x,player_vec3.z).distance_to(Vector2(enemy_vec3.x,enemy_vec3.z)) <= 3:
		direction = Vector3(0,0,0)
	move_and_slide(direction * delta, Vector3.UP)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass







