extends Area2D

var speed = 75
#Called when node enters screen
func _ready():
	set_as_top_level(true)
	
	
#Controls speed/movement of projectile
func _process(delta):
	position += (Vector2.RIGHT*speed).rotated(rotation)*delta
	await get_tree().create_timer(30).timeout
	queue_free()
	
	
func slimeball():
	pass
