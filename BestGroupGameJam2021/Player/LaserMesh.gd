extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var player = get_parent().get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("LaserMovement")
#	transform = player.transform
#func _process(delta):
#	if translation.z == -13:
#		print("laserdeleteself")
#		queue_free()
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
#
#
#func _on_Collisions_body_entered(body):
#	print(body.name)
#	if body.name != "Player":
#		queue_free()
