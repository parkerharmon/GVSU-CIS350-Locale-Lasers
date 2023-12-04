extends CharacterBody2D

@export var movement_speed = 20.0
@onready var player = get_tree().get_first_node_in_group("player")
@export var health = 80
var dead = false
var slimeball_ready = true
var slimeball = preload("res://scenes/slimeball.tscn")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	$AnimationTree.get("parameters/playback").travel("Walk")
	$AnimationTree.set("parameters/Walk/blend_position", direction)
	move_and_slide()
	update_health()
	
	#SlimeBall Attack
	if slimeball_ready:
		$Marker2D.look_at(player.global_position)
		slimeball_ready = false
		var slimeball_instance = slimeball.instantiate()
		slimeball_instance.rotation = $Marker2D.rotation
		slimeball_instance.global_position = $Marker2D.global_position
		add_child(slimeball_instance)
		await get_tree().create_timer(1).timeout
		slimeball_ready = true

func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	
	if health >= 80:
		healthbar.visible = false
	else:
		healthbar.visible = true


func take_damage(dmg):
	health = health - dmg
	if health <= 0:
		death()


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
