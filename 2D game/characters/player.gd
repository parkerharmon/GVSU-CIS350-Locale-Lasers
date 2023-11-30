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
		
	if health <=0:  # checking if player died
		player_alive = false
		print("you died")
	


func _on_player_hit_box_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = true


func _on_player_hit_box_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_attack_range = false

func enemy_attack():
	if (enemy_in_attack_range and enemy_cooldown):
		print("damage taken")
		health = health-10
		enemy_cooldown = false
		$attack_cooldown.start()

func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	
	

func _on_attack_cooldown_timeout():
	enemy_cooldown = true


func _on_sword_hit_area_entered(_area):
	print("hit")
