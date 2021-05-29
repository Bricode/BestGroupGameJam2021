extends KinematicBody

func _on_Area_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("Player"):
		if PlayerInfo.charge <= 99:
			PlayerInfo.change_charge(50)
			PlayerInfo.change_score(10)
		newlocation()
			
func newlocation():
	hide()
	$Timer.start()
	
func _on_Timer_timeout():
	show()

func _physics_process(delta):
	move_and_collide(Vector3(0,-5,0)* delta)
