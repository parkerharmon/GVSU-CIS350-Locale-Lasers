extends Area2D

var speed = 300
#Called when node enters screen
func _ready():
	set_as_top_level(true)
	
#Controls speed/movement of projectile
func _process(delta):
	position += (Vector2.RIGHT*speed).rotated(rotation)*delta
	
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
	
func RangedSpear():
	pass
