extends KinematicBody

var speed = 100
var space_state
onready var player = get_parent().get_parent().get_node("Player")
var health = 3
var can_hit
var airtime = 0

onready var blood = preload("res://ParticleEffects/SnailBlood.tscn")

func _ready():
	print(player)
	space_state = get_world().direct_space_state

func hit_enemy():
	health -= 1
	var b = blood.instance()
	b.global_transform = global_transform
	get_parent().add_child(b)
	b.set_emitting(true)
	if health <= 0:
		queue_free()
		print("Killed " + filename)

func hit_player():
	PlayerInfo.change_health(-10)
	if PlayerInfo.health <= 0:
		get_tree().change_scene("res://Ui/DeathScreen/DeathScreen.tscn")

func _process(delta):
	if not player:
		return
	if player.transform.origin.distance_to(transform.origin) <= 2:
		return
	var move = Vector3(0,0,0)
	look_at(player.global_transform.origin, Vector3.UP)
	rotation_degrees.x = 0
	var direction = (player.transform.origin - transform.origin).normalized()
	if is_on_floor():
		airtime = 15
	else:
		airtime -= 0.75
	direction.y += airtime
	move_and_slide(direction * delta * speed, Vector3.UP)

func _on_HitZone_body_entered(body):
	if body.is_in_group("Player") and $HitTimer.is_stopped():
		$HitTimer.start(2)
		can_hit = true

func _on_HitTimer_timeout():
	if can_hit:
		hit_player()
		$HitTimer.start(1)

func _on_HitZone_body_exited(body):
	if body.is_in_group("Player"):
		can_hit = false
