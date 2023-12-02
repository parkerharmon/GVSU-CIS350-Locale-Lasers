extends CharacterBody2D
# main player character

@export var Speed: int = 50
@export var Friction: float = 0.15
@export var Acceleration: int = 40
@export var move_speed : float = 100

var enemy_in_attack_range = false
var health = 100
var player_alive = true
var enemy_cooldown = true  # true is when enemy can attack
## PLAYER MOVEMENT

#projectile variables
#var mouse_pos = get_global_mouse_position()  #gets location of mouse 
var shoot_cooldown = true #cooldown for ranged attack
var spear = preload("res://scenes/RangedSpear.tscn") #references RangedSpear scene

#FireBall Variables
var fire_ball_ready = true
var has_fire_ball = true
var fire_ball = preload("res://scenes/fire_ball.tscn")

func _physics_process(_delta):  # underscore represents unused parameter
	var input_vector = Vector2.ZERO
	var x = Vector2.ZERO
	x.x = -1
	x.y = 1
	var attacking = false
	enemy_attack()
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
		print("you died")
	
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
#Checks if player has entered attack range of enemy
func _on_player_hit_box_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = true

#Checks if player has exited enemy attack range
func _on_player_hit_box_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = false
#enemy attacks player 
func enemy_attack():
	if (enemy_in_attack_range and enemy_cooldown):
		print("damage taken")
		health = health-10
		enemy_cooldown = false
		$attack_cooldown.start()

func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	
func _on_sword_hit_area_entered(area):
	if  Input.is_action_pressed("attack"):
		print("sword attack hit")
		
#Random Location
func Random_Location():
	
	pass
func sword_attack():
	pass




