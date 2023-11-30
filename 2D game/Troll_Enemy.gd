extends CharacterBody2D
#Troll Enemy

var speed = 90
var player_chase = false
var player = null

func _physics_process(_delta):
	if (player_chase == true):
		position += (player.position - position)/speed


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false

func enemy():
	pass
