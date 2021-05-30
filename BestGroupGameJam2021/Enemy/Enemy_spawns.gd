extends Node

var number_of_enemys = 0

func _on_Enemy_spawn_timer_timeout():
	if number_of_enemys < 15:
		number_of_enemys += 1
		var enemy_scene = load(["res://Enemy/Enemy.tscn","res://Enemy/Rhino.tscn","res://Enemy/Emu.tscn"][randi() % 3]).instance()
		enemy_scene.transform.origin = get_child(randi() % get_child_count()).transform.origin
		get_parent().get_node("Enemys").add_child(enemy_scene)
