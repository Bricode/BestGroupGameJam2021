extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area_body_shape_entered(body_id, body, body_shape, area_shape):
	print(body)
	if body.is_in_group("Player"):
		if PlayerInfo.charge <= 99:
			PlayerInfo.change_charge(50)
			PlayerInfo.change_score(10)
		newlocation()
			
func newlocation():
	hide()
	var newzpos = rand_range(-1.5,1.5)
	var newxpos = rand_range(-1.5,1.5)
	translation = Vector3(newxpos,0.5,newzpos)
	$Timer.start()
	



func _on_Timer_timeout():
	show()
