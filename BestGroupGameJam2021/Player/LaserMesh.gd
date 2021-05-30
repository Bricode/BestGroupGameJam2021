extends MeshInstance

var move
var can_hit = false
var speed = 50
onready var player = get_parent().get_parent().get_node("Player")

func _process(delta):
	translation += move * delta * speed

func _on_Area_body_entered(body):
	if body.is_in_group("Enemies"):
		body.hit_enemy()
	elif not body.is_in_group("Pickup") and not body.is_in_group("Player") and can_hit:
		queue_free()
	
	if translation.distance_to(player.translation) >= 200:
		queue_free()

func _on_Timer_timeout():
	can_hit = true
