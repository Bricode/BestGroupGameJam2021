extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	$AnimationPlayer.play("Armature001Action001")
	$AnimationPlayer2.play("Armature002Action002")	
	$AnimationPlayer3.play("Armature003Action001")
	$AnimationPlayer4.play("Armature004Action001")
	$AnimationPlayer5.play("ArmatureAction001")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
