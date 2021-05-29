extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_auto_accept_quit(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Exit_pressed():
	get_tree().change_scene("res://Ui/TitleScreen/Title.tscn")
#	pass # Replace with function body.


func _on_NewGame_pressed():
#	PlayerInfo.health = 100 / PlayerInfo.difficulty
#	PlayerInfo.charge = 100 / PlayerInfo.difficulty
#	PlayerInfo.charge_clip = 100 / PlayerInfo.difficulty
#	PlayerInfo.power = 100 / PlayerInfo.difficulty
	PlayerInfo.reset_level()
	PlayerInfo.weapon = false
	PlayerInfo.health = 100
	PlayerInfo.charge = 100
	PlayerInfo.charge_clip = 100
	PlayerInfo.power = 100
	get_tree().change_scene("res://Levels/Level1.tscn")
#	print("yes")
#	pass # Replace with function body.
