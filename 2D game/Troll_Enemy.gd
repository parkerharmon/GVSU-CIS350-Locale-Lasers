extends CharacterBody2D
#Troll Enemy

@export var health = 100
var projectile = null
var dead = false
@export var experience = 1
@onready var loot_base = get_tree().get_first_node_in_group("loot")
@export var movement_speed = 40.0
@onready var player = get_tree().get_first_node_in_group("player")
var player_level_damage
var exp_dust = preload("res://objects/experience_dust.tscn")

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
	player_level_damage = 2
	var damage = 0
	if area.has_method("beartrap"):
		damage = 90
	if area.has_method("RangedSpear"):
		damage = 10
	if area.has_method("fireball"):
		damage = 20
	player_level_damage = player_level_damage * player.experience_level
	take_damage(damage + player_level_damage)
	
func death():
	dead = true
	var new_dust = exp_dust.instantiate()
	new_dust.global_position = $CollisionShape2D.global_position
	new_dust.experience = experience
	get_tree().get_root().add_child(new_dust)
	queue_free()
