extends Control

func _ready():
	$HealthBar.max_value = PlayerInfo.max_health
	$PowerBar.max_value = PlayerInfo.max_power

func _process(delta):
	$HealthBar.value = PlayerInfo.health
	$ChargeBar.value = PlayerInfo.charge
	#$chargeCount.text = str(PlayerInfo.charge_clip) + " / " + str(PlayerInfo.charge)
	#$TextEvent.text = PlayerInfo.textevent
	#$TextEvent/Timer.start(1)
		



#func _on_Timer_timeout():
#	PlayerInfo.textevent = " "
