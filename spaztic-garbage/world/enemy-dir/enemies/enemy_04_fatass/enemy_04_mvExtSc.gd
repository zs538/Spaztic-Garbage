extends EnemyMoveScript

class_name mvExt04

var pushed = false
var beingPushed = false

func getPushed():
	if !pushed:
		beingPushed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !beingPushed:
		super._physics_process(delta)
	else:
		var newPosX = position.x + 6
		position.x = lerpf(position.x, newPosX, delta*10)
		pushed = true
	
	if position.x > 6:
		beingPushed = false
