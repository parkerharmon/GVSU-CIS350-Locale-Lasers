extends CharacterBody2D
#Troll Enemy

@export var health = 100
var projectile = null
var dead = false

@export var movement_speed = 40.0
@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	$AnimationTree.get("parameters/playback").travel("Walk")
	$AnimationTree.set("parameters/Walk/blend_position", direction)
	move_and_slide()


	update_health()
	if health <= 0 and !dead:
		death()
		


func enemy():
	pass
	


func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true

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
		damage = 20
		
	take_damage(damage)
	
func death():
	dead = true
	queue_free()
