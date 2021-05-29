extends MeshInstance

var move
var speed = 50

func _process(delta):
	translation += move * delta * speed
	
func _on_Area_body_entered(body):
	if body.is_in_group("Enemies"):
		body.hit_enemy()
