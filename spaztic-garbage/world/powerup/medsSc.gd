extends Node3D

class_name PickupSc

var pickupHp = 1

func pickupGetDamaged():
	pickupHp -= 1

func _process(delta: float) -> void:
	if pickupHp < 1:
		worldValues.meds()
		get_parent_node_3d().queue_free()
