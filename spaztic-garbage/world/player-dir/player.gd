extends Node3D

class_name player

var playerPosittions = [-0.5, 0, 0.5]
var currPlayerPosIndex = 1
var dashCharged = true

var holdsGun = false
var gunCharged = true

var canMove = true

var sproked = false

@onready var damageSensor = $CharacterBody3D/damageSensor
@onready var bulletSensor = $CharacterBody3D/bulletSensor
@onready var pickupSensor = $CharacterBody3D/pickupSensor

@export var stuff: Array[PackedScene] = []

func rechargeDash():
	dashCharged = true

func playerGetDamaged():
	worldValues.getDamaged()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		if currPlayerPosIndex > 0:
			currPlayerPosIndex -= 1
			$moveSFX.play()
				
	if Input.is_action_just_pressed("right"):
		if currPlayerPosIndex < 2:
			currPlayerPosIndex += 1
			$moveSFX.play()
				
	if Input.is_action_just_pressed("attackAction"):
		if !holdsGun:
			if dashCharged:
				worldValues.dash()
				$dashSFX.play()
				dashCharged = false
				await get_tree().create_timer(0.85).timeout
				dashCharged = true
		else:
			if gunCharged:
				worldValues.shootGun(playerPosittions[currPlayerPosIndex])
				$shootSFX.play()
				gunCharged = false
				await get_tree().create_timer(1.0).timeout
				gunCharged = true
	
	if Input.is_action_pressed("switchWeaponHold"):
		holdsGun = true
	else:
		holdsGun = false
	
	if Input.is_action_just_pressed("back"):
		worldValues.death()
	
	position.z = lerpf(position.z, playerPosittions[currPlayerPosIndex], delta*20)
	
	if damageSensor.is_colliding():
		if worldValues.playerDashing:
			if damageSensor.get_collider() != null:
				if damageSensor.get_collider().has_method("enemyGetDamaged"):
					damageSensor.get_collider().enemyGetDamaged()
		else:
			worldValues.getDamaged()
			$damagedSFX.play()
	
	if bulletSensor.is_colliding():
		if bulletSensor.get_collider() != null:
			if bulletSensor.get_collider().has_method("bulletDamage"):
				bulletSensor.get_collider().bulletDamage()
				$damagedSFX.play()
	
	if pickupSensor.is_colliding():
		if pickupSensor.get_collider() != null:
			if pickupSensor.get_collider().has_method("pickupGetDamaged"):
				pickupSensor.get_collider().pickupGetDamaged()
	
	if worldValues.playerSproking:
		if !sproked:
			$sprokeSFX.play()
			sproked = true
	else:
		sproked = false
	
	if worldValues.playerMedicating:
		$medsSFX.play()
	
	worldValues.addScore(1)
