extends Node3D

class_name player

var playerPosittions = [-0.5, 0, 0.5]
var currPlayerPosIndex = 1
var dashCharged = true

var holdsGun = false
var gunCharged = true

var canMove = true

@onready var damageSensor = $CharacterBody3D/damageSensor
@onready var bulletSensor = $CharacterBody3D/bulletSensor

var playerBullet = preload("res://world/player-dir/playerBullet.tscn").instantiate()

func playerGetDamaged():
	worldValues.getDamaged()

func shootGun():
	var playerBulletNew = playerBullet
	playerBulletNew.position.x = 0
	playerBulletNew.position.z = playerPosittions[currPlayerPosIndex]
	if playerBulletNew.get_parent() != null:
		playerBulletNew.get_parent().remove_child(playerBulletNew)
	add_child(playerBullet)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		if currPlayerPosIndex > 0:
			currPlayerPosIndex -= 1
				
	if Input.is_action_just_pressed("right"):
		if currPlayerPosIndex < 2:
			currPlayerPosIndex += 1
				
	if Input.is_action_just_pressed("attackAction"):
		if !holdsGun:
			if dashCharged:
				worldValues.dash()
				dashCharged = false
				await get_tree().create_timer(1.0).timeout
				dashCharged = true
		else:
			if gunCharged:
				shootGun()
				gunCharged = false
				await get_tree().create_timer(1.0).timeout
				gunCharged = true
	
	if Input.is_action_pressed("switchWeaponHold"):
		holdsGun = true
	else:
		holdsGun = false
	
	position.z = lerpf(position.z, playerPosittions[currPlayerPosIndex], delta*20)
	
	if damageSensor.is_colliding():
		if damageSensor.get_collider() != null:
			if worldValues.playerDashing and damageSensor.get_collider().has_method("enemyGetDamaged"):
				damageSensor.get_collider().enemyGetDamaged()
		else:
			worldValues.getDamaged()
			
	if bulletSensor.is_colliding():
		if bulletSensor.get_collider() != null:
			if bulletSensor.get_collider().has_method("bulletDamage"):
				bulletSensor.get_collider().bulletDamage()
	
	worldValues.addScore(1)
	#
	#if worldValues.playerLife == 0:
		#get_tree().reload_current_scene()
