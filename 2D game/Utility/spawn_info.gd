extends Resource

class_name Spawn_info

# These two variables dictate the spawn window of the enemies within the spawner loop
@export var time_start:int 
@export var time_end:int

@export var enemy:Resource # tells which enemy will spawn
@export var enemy_num:int # the number of said enemy that will spawn
@export var enemy_spawn_delay:int # delay between each spawn within the window

var spawn_delay_counter = 0 # tracking said delay
