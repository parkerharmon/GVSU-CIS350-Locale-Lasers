extends CharacterBody2D
# main player character

@export var move_speed : float = 100
@onready var healthbar = $healthbar

# experience variables
var experience = 0
@export var experience_level = 1
var collected_experience = 0
var time = 0
var minute = 0

# GUI
@onready var lblLevel = get_node("%Label_Level")
@onready var lblTimer = get_node("%Label_Timer")

# player stats
var health = 100
var player_alive = true

## PLAYER MOVEMENT

#projectile variables
#var mouse_pos = get_global_mouse_position()  #gets location of mouse 
var shoot_cooldown = true #cooldown for ranged attack
var spear = preload("res://scenes/RangedSpear.tscn") #references RangedSpear scene

#FireBall Variables
var fire_ball_ready = true
var has_fire_ball = false
var fire_ball = preload("res://scenes/fire_ball.tscn")

#Beartrap variables
var beartrap_ready = true
var has_beartrap = false
var beartrap = preload("res://scenes/Bear_trap.tscn")

func _physics_process(_delta):  # underscore represents unused parameter
	var input_vector = Vector2.ZERO
	var x = Vector2.ZERO
	x.x = -1
	x.y = 1
	var attacking = false
	#enemy_attack()
	update_health()
	
	# get input direction
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	# update velocity
	velocity = input_vector.normalized() * move_speed
	
	#sword attack
	attacking = Input.is_action_pressed("attack")  # checking if player attacks
	if attacking:
		$AnimationTree.get("parameters/playback").travel("Attack")
		

	
	elif velocity == Vector2.ZERO:  # If character isn't moving, aka no input we will use idle position
		$AnimationTree.get("parameters/playback").travel("Idle")  
	else:  # else we will update the animation to run in the given velocity
		
		$AnimationTree.get("parameters/playback").travel("Run")
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
		$AnimationTree.set("parameters/Attack/blend_position", velocity)
		$AnimationTree.set("parameters/Run/blend_position", velocity)
		move_and_slide()
		#end sword attack
	
	if health <=0:  # checking if player died
		player_alive = false
		get_tree().change_scene_to_file("res://scenes/Death_Scene.tscn")
	
	#Projectile Spear
	var mouse_pos = get_global_mouse_position()  #gets location of mouse 
	$Marker2D.look_at(mouse_pos) 
	if Input.is_action_just_pressed("right_mouse") and shoot_cooldown:
		shoot_cooldown =false
		var spear_instance = spear.instantiate()
		spear_instance.rotation = $Marker2D.rotation
		spear_instance.global_position = $Marker2D.global_position
		add_child(spear_instance)
		await get_tree().create_timer(0.5).timeout
		shoot_cooldown = true 
		#END PROJECTILE SPEAR
		
	#FireBall
	if experience_level >= 5:
		has_fire_ball = true
	if fire_ball_ready and has_fire_ball:
		$Marker2D.look_at(mouse_pos)
		fire_ball_ready = false
		var fire_ball_instance = fire_ball.instantiate()
		fire_ball_instance.rotation = $Marker2D.rotation
		fire_ball_instance.global_position = $Marker2D.global_position
		add_child(fire_ball_instance)
		await get_tree().create_timer(1).timeout
		fire_ball_ready = true
	#ENDS FIREBALL
	
	#Beartrap
	if Input.is_action_just_pressed("e"):
		if experience_level >= 3:
			has_beartrap = true
		if beartrap_ready and has_beartrap:
			beartrap_ready = false
			var beartrap_instance = beartrap.instantiate()
			beartrap_instance.global_position = $Marker2D.global_position
			add_child(beartrap_instance)
			await get_tree().create_timer(4).timeout
			beartrap_ready = true
	#END BEARTRAP
	
# HURTING THE PLAYER
func _on_hurt_box_hurt(damage):
	health -= damage
	


# UPDATING PLAYER HEALTH
func update_health():
	healthbar.value = health
	
func _on_sword_hit_area_entered(_area):
	if  Input.is_action_pressed("attack"):
		print("sword attack hit")
		

#Random Location
func Random_Location():
	pass
	
func sword_attack():
	pass
	

# Item functions
func _on_grab_area_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self


func _on_collect_area_area_entered(area):
	if area.is_in_group("loot"):
		var dust_exp = area.collect()
		calculate_experience(dust_exp)

func calculate_experience(dust_exp):
	var exp_required = calculate_experiencecap()
	collected_experience += dust_exp
	if experience + collected_experience >= exp_required: # leveling up
		collected_experience -= exp_required-experience
		experience_level+=1
		if health <= 80:
			health += 20
		else:
			health = 100
		lblLevel.text = str("Level", experience_level)
		experience = 0
		exp_required = calculate_experiencecap()
		calculate_experience(0) # loop again to make sure we can account for double level ups
	else:
		experience += collected_experience
		collected_experience
	

	
func calculate_experiencecap():
	var exp_cap = experience_level
	if experience_level < 20:
		exp_cap = experience_level*4
	elif experience_level < 40:
		exp_cap = 95 * (experience_level-19) * 8
	else:
		exp_cap = 255 + (experience_level-39) * 12
	return exp_cap
	
# end Item functions

func _on_game_timer_timeout():
	time+=1
	if time == 60:
		time = 0
		minute += 1
	lblTimer.text = str("Time:",minute,":", time)
	if time == 600:
		get_tree().change_scene_to_file("res://scenes/you_win.tscn")
