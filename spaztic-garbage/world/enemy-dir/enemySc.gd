extends Node3D

class_name EnemySc

var enemyHp = 0
var points = 0

func enemyGetDamaged():
	enemyHp -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if enemyHp < 1:
		worldValues.addScore(points)
		get_parent_node_3d().queue_free()
