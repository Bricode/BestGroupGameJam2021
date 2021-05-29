extends Control

func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.

func _on_NewGame_pressed():
	PlayerInfo.score = 0
	PlayerInfo.health = 100
	PlayerInfo.charge = 100
	get_tree().change_scene("res://Levels/City.tscn")

