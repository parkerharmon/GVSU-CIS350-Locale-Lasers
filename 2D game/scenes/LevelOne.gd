extends Node2D
 
var Enemy_Spawn = true
var enemy_troll = preload("res://enemy_troll(1).tscn")
var x = 0
func _physics_process(delta):
	if x < 1:
		var troll_instance = enemy_troll.instantiate()
		troll_instance.global_position = $Spawner.global_position
		add_child(troll_instance)
		x += 1
