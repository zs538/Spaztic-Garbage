extends EnemyMoveScript

var movePos = position.z - 0.5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if position.x <= 4:
		position.z = lerpf(position.z, movePos, delta*10)
