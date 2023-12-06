extends Area2D
#Called when node enters screen
func _ready():
	set_as_top_level(true)
	
	
#Controls speed/movement of projectile
func _process(delta):
	await get_tree().create_timer(8).timeout
	queue_free()
	

func beartrap():
	pass
func _on_body_entered(body):
	if body.is_in_group("enemy"):
		queue_free()
	
	
