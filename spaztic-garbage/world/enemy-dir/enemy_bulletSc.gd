extends Node3D

@onready var collisionObj = $StaticBody3D/RayCast3D
var speed = worldValues.worldSpeed * 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if worldValues.playerDashing:
		position.x -= speed*delta*3
	else:
		position.x -= speed*delta
		
	if position.x <= -1:
		queue_free()
	
	if collisionObj.is_colliding():
		if collisionObj.get_collider().has_method("playerGetDamaged"):
			worldValues.getDamaged()
			queue_free()
