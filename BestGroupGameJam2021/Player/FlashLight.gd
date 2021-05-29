extends SpotLight


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.

func _on_PowerDrain_timeout():
	if visible == true:
		PlayerInfo.change_power(-1)
#	pass # Replace with function body.
