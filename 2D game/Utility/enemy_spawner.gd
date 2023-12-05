# The spawner class for dictating random spawns of the enemies within the game

extends Node2D

@export var spawns: Array[Spawn_info] = []

@onready var player = get_tree().get_first_node_in_group("player")

var time = 0

func _on_timer_timeout():
	time += 1 # incrementing the time within the spawner class
	var enemy_spawns = spawns
	for i in enemy_spawns:
		if time >= i.time_start and time <= i.time_end: # checking the window of time specified in the spawner
			if i.spawn_delay_counter < i.enemy_spawn_delay: # conditional for checking if the spawn is on a delay or not
				i.spawn_delay_counter += 1
			else:  
				i.spawn_delay_counter = 0
				var new_enemy = load(str(i.enemy.resource_path)) # loads the scene of the desired enemy to be spawned
				var counter = 0
				while counter < i.enemy_num: # spawning the enemies within the current wave at random positions on the map
					var enemy_spawn = new_enemy.instantiate() # creating instance of new enemy
					enemy_spawn.global_position = get_random_position()
					add_child(enemy_spawn)
					counter += 1

func get_random_position(): # function to get a random position based around the payers current position
	var vpr = get_viewport_rect().size * randf_range(1.1,1.4) # gives a box right outside of the players screen
	var top_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y - vpr.y/2)
	var top_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y - vpr.y/2)
	var bottom_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y + vpr.y/2)
	var bottom_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y + vpr.y/2)
	var pos_side = ["up","down","right","left"].pick_random() # picking a random direction from the player
	var spawn_pos1 = Vector2.ZERO
	var spawn_pos2 = Vector2.ZERO
	
	match pos_side:
		"up":
			spawn_pos1 = top_left
			spawn_pos2 = top_right
		"down":
			spawn_pos1 = bottom_left
			spawn_pos2 = bottom_right
		"right":
			spawn_pos1 = top_right
			spawn_pos2 = bottom_right
		"left":
			spawn_pos1 = top_left
			spawn_pos2 = bottom_left
	
	var x_spawn = randf_range(spawn_pos1.x, spawn_pos2.x)
	var y_spawn = randf_range(spawn_pos1.y, spawn_pos2.y)
	return Vector2(x_spawn, y_spawn)
	
	
