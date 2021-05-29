extends MeshInstance

var move
var speed = 50
onready var player = get_parent().get_parent().get_node("Player")

func _process(delta):
	translation += move * delta * speed
	
func _on_Area_body_entered(body):
	if body.is_in_group("Enemies"):
		body.hit_enemy()
	else:
		queue_free()
	
	if translation.distance_to(player.translation) >= 200:
		queue_free()
