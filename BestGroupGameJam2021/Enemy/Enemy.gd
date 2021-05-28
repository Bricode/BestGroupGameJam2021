extends KinematicBody

var speed = 100
var space_state
var target
var health = 3
var can_hit

onready var blood = preload("res://ParticleEffects/SnailBlood.tscn")

func _ready():
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
	if target:
		var result = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if result.collider.is_in_group("Player"):
			look_at(target.global_transform.origin, Vector3.UP)
			var direction = (target.transform.origin - transform.origin).normalized()
			direction.y += 10
			move_and_slide(direction * speed * delta, Vector3.UP)

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		print(body.name + " entered")

func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		target = null
		print(body.name + " exited")

func _on_HitZone_body_entered(body):
	if body.is_in_group("Player") and $HitTimer.is_stopped():
		$HitTimer.start(1)
		can_hit = true

func _on_HitTimer_timeout():
	if can_hit:
		hit_player()
		$HitTimer.start(1)

func _on_HitZone_body_exited(body):
	if body.is_in_group("Player"):
		can_hit = false
