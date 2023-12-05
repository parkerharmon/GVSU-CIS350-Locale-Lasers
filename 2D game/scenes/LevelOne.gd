extends Node2D
 
var Enemy_Spawn = true
var enemy_troll = preload("res://enemy_troll(1).tscn")
var x =1
var spawn_time = 10
var spawn_count = 0
#Enemy spawn function
func _physics_process(_delta):
	pass
func troll_spawn(x):
	await get_tree().create_timer(spawn_time).timeout
	if x == 1 and Enemy_Spawn:
		Enemy_Spawn = false
		var troll_instance = enemy_troll.instantiate()
		troll_instance.global_position = $Spawner.global_position
		add_child(troll_instance)
		await get_tree().create_timer(spawn_time).timeout
		Enemy_Spawn = true
		#update_spawn_time(spawn_count)
		spawn_count +=1
		
		
		
	
	if x == 2 and Enemy_Spawn:
		Enemy_Spawn = false
		var troll_instance = enemy_troll.instantiate()
		enemy_troll.instantiate()
		troll_instance.global_position = $Spawner2.global_position
		add_child(troll_instance)
		await get_tree().create_timer(spawn_time).timeout
		Enemy_Spawn = true
		spawn_count +=1
		
		
		
	if x == 3 and Enemy_Spawn:
		Enemy_Spawn = false
		var troll_instance = enemy_troll.instantiate()
		enemy_troll.instantiate()
		troll_instance.global_position = $Spawner3.global_position
		add_child(troll_instance)
		await get_tree().create_timer(spawn_time).timeout
		Enemy_Spawn = true
		spawn_count +=1
		
func update_spawn_time(round):
		spawn_count = 0

func _on_timer_2_timeout():
	#x+=1
	if x==4:
		x=1
	troll_spawn(x)
	if spawn_time>5:
		spawn_time -= .5
	elif spawn_time >1:
		spawn_time -= .25
	elif spawn_time <= 1:
		spawn_time = 0.5
	print (spawn_time)
	troll_spawn(x)
