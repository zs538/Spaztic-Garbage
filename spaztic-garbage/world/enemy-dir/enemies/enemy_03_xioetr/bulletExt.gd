extends Node3D

func bulletDamage():
	worldValues.getDamaged()
	queue_free()
