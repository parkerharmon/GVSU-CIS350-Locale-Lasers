extends CharacterBody2D

@export var movement_speed = 20.0
@onready var player = get_tree().get_first_node_in_group("player")
var health = 50
var dead = false

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	$AnimationTree.get("parameters/playback").travel("Walk")
	$AnimationTree.set("parameters/Walk/blend_position", direction)
	move_and_slide()

func take_damage(dmg):
	health = health - dmg


func _on_slime_hitbox_area_entered(area):
	var damage = 0
	if area.has_method("RangedSpear"):
		damage = 10
	if area.has_method("sword_attack"):
		damage = 20
	if area.has_method("fireball"):
		damage = 20
	take_damage(damage)
	
func death():
	dead = true
	queue_free()
