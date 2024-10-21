extends "res://world/enemy-dir/enemyScMove.gd"

var movePos = position.z + 0.5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
	if position.x <= 4:
		position.z = lerpf(position.z, movePos, delta*10)
