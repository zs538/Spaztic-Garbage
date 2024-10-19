extends Node3D

var playerPosittions = [-0.5, 0, 0.5]
var currPlayerPosIndex = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		if currPlayerPosIndex > 0:
			currPlayerPosIndex -= 1
	if Input.is_action_just_pressed("right"):
		if currPlayerPosIndex < 2:
			currPlayerPosIndex += 1
	if Input.is_action_just_pressed("attackAction"):
		worldValues.dash()
	
	position.z = lerpf(position.z, playerPosittions[currPlayerPosIndex], delta*30)
