extends Node3D

var playerPosittions = [-0.5, 0, 0.5]
var currPlayerPosIndex = 1
var dashCharged = true

@onready var damageSensor = $CharacterBody3D/damageSensor

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		if currPlayerPosIndex > 0:
			currPlayerPosIndex -= 1
	if Input.is_action_just_pressed("right"):
		if currPlayerPosIndex < 2:
			currPlayerPosIndex += 1
	if Input.is_action_just_pressed("attackAction"):
		if dashCharged:
			worldValues.dash()
			dashCharged = false
			await get_tree().create_timer(1.0).timeout
			dashCharged = true
	
	position.z = lerpf(position.z, playerPosittions[currPlayerPosIndex], delta*20)
	
	if damageSensor.is_colliding():
		worldValues.getDamaged()
		
	#if worldValues.playerLife == 0:
		#get_tree().reload_current_scene()
