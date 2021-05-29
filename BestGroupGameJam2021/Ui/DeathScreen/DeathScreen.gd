extends Control

var current = 0

func _ready():
	current = PlayerInfo.get_score()
	$YouDied/Add_score/Currnet.text = "Current:" + str(current)
	show_high_score() 

func _on_Exit_pressed():
	get_tree().change_scene("res://Ui/TitleScreen/Title.tscn")

func _on_NewGame_pressed():
	PlayerInfo.reset_level()
	PlayerInfo.weapon = false
	PlayerInfo.health = 100
	PlayerInfo.charge = 100
	PlayerInfo.charge_clip = 100
	PlayerInfo.power = 100
	get_tree().change_scene("res://Levels/Level1.tscn")

func add_hight_score(number,name):
	$YouDied/Add_score/Add_score_button.disabled = true
	$YouDied/Add_score/Add_score_button.visible = false
	$YouDied/Add_score/TextEdit.visible = false
	$YouDied/Add_score/Name.visible = false
	var save = load("user://save.res")
	var added = false
	for p in range(len(save.places)):
		if save.places[p].score <= number:
			save.places.insert(p,{"name":name,"score":number})
			added = true
			break
	if not added:
		save.places.append({"name":name,"score":number})
	print(ResourceSaver.save("user://save.res",save))
	show_high_score()

func show_high_score():
	var save = load("user://save.res")
	if not save:
		save = Resource.new()
		save.set_script(load("res://Ui/HighscoreWindow/High_score_save.gd"))
		print(ResourceSaver.save("user://save.res",save))
	
	for l in $HighScores/ScrollContainer/Box.get_children():
		l.queue_free()
	
	for p in save.places:
		var lab = Label.new()
		lab.text = p.name + ":" + str(p.score)
		$HighScores/ScrollContainer/Box.add_child(lab)

func _on_Add_score_button_down():
	add_hight_score(current,$YouDied/Add_score/TextEdit.text)
