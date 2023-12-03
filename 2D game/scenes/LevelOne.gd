extends Node2D
 
var Enemy_Spawn = true
var enemy_troll = preload("res://enemy_troll(1).tscn")
var x =0
#Enemy spawn function
func _physics_process(_delta):
	x+=1
	if x==4:
		x=1
	troll_spawn(x)
	
	
func troll_spawn(x):
	await get_tree().create_timer(2).timeout
	if x == 1 and Enemy_Spawn:
		Enemy_Spawn = false
		var troll_instance = enemy_troll.instantiate()
		troll_instance.global_position = $Spawner.global_position
		add_child(troll_instance)
		await get_tree().create_timer(2).timeout
		Enemy_Spawn = true
		
		
		
	
	if x == 2 and Enemy_Spawn:
		Enemy_Spawn = false
		var troll_instance = enemy_troll.instantiate()
		enemy_troll.instantiate()
		troll_instance.global_position = $Spawner2.global_position
		add_child(troll_instance)
		await get_tree().create_timer(2).timeout
		Enemy_Spawn = true
		
		
		
	if x == 3 and Enemy_Spawn:
		Enemy_Spawn = false
		var troll_instance = enemy_troll.instantiate()
		enemy_troll.instantiate()
		troll_instance.global_position = $Spawner3.global_position
		add_child(troll_instance)
		await get_tree().create_timer(2).timeout
		Enemy_Spawn = true
		
		
		
		
