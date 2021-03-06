extends KinematicBody

var speed = 200
onready var player = get_parent().get_parent().get_node("Player")
var health = 2
var airtime = 2

onready var blood = preload("res://ParticleEffects/Spark.tscn")


func hit_enemy():
	health -= 1
	var b = blood.instance()
	b.global_transform = global_transform
	get_parent().add_child(b)
	b.set_emitting(true)
	if health <= 0:
		get_parent().get_parent().get_node("Enemy_Spawns").number_of_enemys -= 1
		PlayerInfo.change_score(100)
		queue_free()

func _process(delta):
	if not player:
		return
	var move = Vector3(0,0,0)
	look_at(player.global_transform.origin, Vector3.UP)
	rotation_degrees.x = 0
	var direction = -player.transform.origin.direction_to(transform.origin) *speed
	var player_vec3 = player.transform.origin
	var enemy_vec3 = transform.origin
	if Vector2(player_vec3.x,player_vec3.z).distance_to(Vector2(enemy_vec3.x,enemy_vec3.z)) <= 2:
		direction = Vector3(0,0,0)
	if is_on_floor():
		$bounce.play()
		airtime = 15
	else:
		airtime -= 50*delta
		if airtime <= -10:
			airtime = -10
	direction.y = airtime*100
	move_and_slide(direction * delta, Vector3.UP)

func _on_HitZone_body_entered(body):
	if body.is_in_group("Player") and $HitTimer.is_stopped():
		$HitTimer.start(0.2)

func _on_HitTimer_timeout():
	if $HitZone.overlaps_body(player):
		player.hit(-10)
		$HitTimer.start(1)

