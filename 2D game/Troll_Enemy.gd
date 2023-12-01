extends CharacterBody2D
#Troll Enemy

var speed = 90
var player_chase = false
var player = null
var health = 100
var projectile = null
var dead = false
func _physics_process(_delta):
	velocity.x = 0
	velocity.y = 0
	if (player_chase == true):
		position += (player.position - position)/speed
		velocity.x = (player.position - position)[0]
		velocity.y = (player.position - position)[1]
		velocity = velocity.normalized()
		print(velocity)
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Walking/blend_position",velocity)
		move_and_slide()
	
	update_health()
	if health <= 0 and !dead:
		death()
		



func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	


func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false
	
	

func enemy():
	pass
	


func update_health():
	var healthbar = $healthbar
	healthbar.value = health

func take_damage(dmg):
	health = health - dmg

func _on_troll_hit_box_area_entered(area):
	var damage = 0
	if area.has_method("RangedSpear"):
		damage = 10
	if area.has_method("sword_attack"):
		print("troll damage")
		damage = 20
	if area.has_method("fireball"):
		damage = 100
		
	take_damage(damage)
	
func death():
	dead = true
	queue_free()
