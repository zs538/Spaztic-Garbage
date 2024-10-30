extends Node

@export var worldSpeed = 7.0
var playerLife = 3
var playerDashing = false
var playerInvincible = false
var playerScore = 0

var enemyMewing = false

@onready var playerBullet = preload("res://world/player-dir/playerBullet.tscn")
@onready var playerRay = preload("res://world/player-dir/playerRay.tscn")


func dash():
	playerDashing = true
	await get_tree().create_timer(0.3).timeout
	playerDashing = false
	await get_tree().create_timer(0.1).timeout

func shootGun(posZ):
	var playerBulletNew = playerBullet.instantiate()
	if is_instance_valid(playerBulletNew):
		playerBulletNew.position.x = 0
		playerBulletNew.position.z = posZ
		if playerBulletNew.get_parent() != null:
			playerBulletNew.get_parent().remove_child(playerBulletNew)
		add_child(playerBulletNew)

func shootRay(posZ):
	var playerRayNew = playerRay.instantiate()
	if is_instance_valid(playerRayNew):
		playerRayNew.position.x = 0
		playerRayNew.position.z = posZ
		if playerRayNew.get_parent() != null:
			playerRayNew.get_parent().remove_child(playerRayNew)
		add_child(playerRayNew)

func getDamaged():
	if playerInvincible == false:
		playerInvincible = true
		playerLife -= 1
		await get_tree().create_timer(0.2).timeout
		playerInvincible = false
		
#func enemyGetDamaged(collidingEnemy):
	#collidingEnemy.queue_free()

var speedPoints = 0

func addScore(points):
	playerScore += points
	speedPoints += points

func _process(delta: float) -> void:
	if speedPoints >= 1000:
		worldSpeed += 0.2
		speedPoints = 0
