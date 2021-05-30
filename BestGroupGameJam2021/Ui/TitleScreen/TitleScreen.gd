extends Control

func _onready():
	$laserkiwi.visible = true

func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.

func _on_NewGame_pressed():
	PlayerInfo.score = 0
	PlayerInfo.health = 100
	PlayerInfo.charge = 500
	get_tree().change_scene("res://Levels/City.tscn")

func _process(delta):
	if PlayerInfo.konami_code == true:
		$laserkiwi.visible = false
