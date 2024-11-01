extends Node3D

var pickupHp = 1
var points = 50

func pickupGetDamaged():
	pickupHp -= 1

func _process(delta: float) -> void:
	if pickupHp < 1:
		worldValues.sproke()
		worldValues.addScore(points)
		get_parent_node_3d().queue_free()
