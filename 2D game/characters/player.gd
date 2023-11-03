extends CharacterBody2D
# main player character

@export var Speed: int = 50
@export var Friction: float = 0.15
@export var Acceleration: int = 40
@export var move_speed : float = 100


## PLAYER MOVEMENT
func _physics_process(_delta):  # underscore represents unused parameter
	var input_vector = Vector2.ZERO
	# get input direction
	
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	
	# update velocity
	velocity = input_vector.normalized() * move_speed
	if velocity == Vector2.ZERO:  # If character isn't moving, aka no input we will use idle position
		$AnimationTree.get("parameters/playback").travel("Idle")  
	else:  # else we will update the animation to run in the given velocity
		
		$AnimationTree.get("parameters/playback").travel("Run")
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
		$AnimationTree.set("parameters/Run/blend_position", velocity)
		move_and_slide()
		
	
	
