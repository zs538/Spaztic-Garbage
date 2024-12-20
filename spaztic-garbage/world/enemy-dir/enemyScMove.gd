extends Node3D

class_name EnemyMoveScript

var speed = worldValues.worldSpeed

func reload():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if worldValues.playerDashing:
		position.x -= speed*delta*3
	else: if worldValues.playerSproking:
		position.x -= speed*delta*2
	else:
		position.x -= speed*delta
	
	if position.x <= -1:
		queue_free()
