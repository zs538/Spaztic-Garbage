extends StaticBody3D

@onready var enemySensor = $enemySensor

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if enemySensor.is_colliding():
		if enemySensor.get_collider().has_method("enemyGetDamaged"):
			enemySensor.get_collider().enemyGetDamaged()
			get_parent_node_3d().bulletDeath()
