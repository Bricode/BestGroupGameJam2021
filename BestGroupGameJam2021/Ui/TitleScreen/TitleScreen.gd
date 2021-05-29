extends Control

func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_NewGame_pressed():
#	PlayerInfo.health = 100 / PlayerInfo.difficulty
#	PlayerInfo.charge = 100 / PlayerInfo.difficulty
#	PlayerInfo.charge_clip = 100 / PlayerInfo.difficulty
#	PlayerInfo.power = 100 / PlayerInfo.difficulty
	PlayerInfo.reset_level()
	PlayerInfo.weapon = true
	PlayerInfo.score = 0
	PlayerInfo.health = 100
	PlayerInfo.charge = 100
	#PlayerInfo.charge_clip = 1
	#PlayerInfo.power = 100
	get_tree().change_scene("res://Levels/TestLevel.tscn")
#	print("yes")
#	pass # Replace with function body.
