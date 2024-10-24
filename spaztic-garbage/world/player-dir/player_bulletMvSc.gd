extends Node3D

var speed = worldValues.worldSpeed * 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.z -= speed*delta
		
	if position.z >= 60:
		queue_free()
