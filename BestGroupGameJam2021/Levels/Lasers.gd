extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var lasermesh = preload("res://Player/LaserMesh.tscn")
onready var target 
onready var TargetSet =get_parent().get_node("Player/Head/Camera/Weapons/gun").laserReady 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	target = get_parent().get_node("Player/Head/Camera/Weapons/gun").check_collision()
func _input(event):
	if Input.is_action_just_pressed("primary_fire"):
		var laser = add_child(lasermesh.instance())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
