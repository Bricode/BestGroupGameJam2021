extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_auto_accept_quit(false)
	#new_hight_score(1,"kiwi2") 


func _on_Exit_pressed():
	get_tree().change_scene("res://Ui/TitleScreen/Title.tscn")
#	pass # Replace with function body.


func _on_NewGame_pressed():
#	PlayerInfo.health = 100 / PlayerInfo.difficulty
#	PlayerInfo.charges = 100 / PlayerInfo.difficulty
#	PlayerInfo.charges_clip = 100 / PlayerInfo.difficulty
#	PlayerInfo.power = 100 / PlayerInfo.difficulty
	PlayerInfo.reset_level()
	PlayerInfo.weapon = false
	PlayerInfo.health = 100
	PlayerInfo.charges = 100
	PlayerInfo.charges_clip = 100
	PlayerInfo.power = 100
	get_tree().change_scene("res://Levels/Level1.tscn")
#	print("yes")
#	pass # Replace with function body.

func new_hight_score(number,name):
	var save = load("user://save.res")
	if not save:
		save = Resource.new()
		save.set_script(load("res://Ui/HighscoreWindow/High_score_save.gd"))
	var added = false
	for p in range(len(save.places)):
		if save.places[p].score <= number:
			save.places.insert(p,{"name":name,"score":number})
			added = true
			break
	if not added:
		save.places.append({"name":name,"score":number})
	print(ResourceSaver.save("user://save.res",save))
	for p in save.places:
		var lab = Label.new()
		lab.text = p.name + ":" + str(p.score)
		$HighScores/Box.add_child(lab)
	#$HighScores/Currnet.text = "Current:" + str(number)
