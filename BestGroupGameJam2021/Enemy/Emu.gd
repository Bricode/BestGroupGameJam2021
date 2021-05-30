extends KinematicBody

onready var blood = preload("res://ParticleEffects/Spark.tscn")
onready var player = get_parent().get_parent().get_node("Player")
var speed = 200
var health = 1

func _ready():
	$EMU/AnimationPlayer.play("Running Attack")
	
func _process(delta):
	var move = Vector3(0,0,0)
	look_at(player.global_transform.origin, Vector3.UP)
	rotation_degrees.x = 0
	var direction = -player.transform.origin.direction_to(transform.origin) *speed
	var player_vec3 = player.transform.origin
	var enemy_vec3 = transform.origin
	if Vector2(player_vec3.x,player_vec3.z).distance_to(Vector2(enemy_vec3.x,enemy_vec3.z)) <= 2:
		direction = Vector3(0,0,0)
	direction.y = -800
	move_and_slide(direction * delta, Vector3.UP)

func _on_Hit_zone_body_entered(body):
	if body.is_in_group("Player"):
		$Hit_timer.start(0.5)
		
func _on_Hit_timer_timeout():
	if $Hit_zone.overlaps_body(player):
		#$screeach.play()
		player.hit(-12)
		$Hit_timer.start(1)

func hit_enemy():
	health -= 1
	var b = blood.instance()
	b.global_transform = global_transform
	get_parent().add_child(b)
	b.set_emitting(true)
	if health <= 0:
		get_parent().get_parent().get_node("Enemy_Spawns").number_of_enemys -= 1
		PlayerInfo.change_score(50)
		queue_free()
