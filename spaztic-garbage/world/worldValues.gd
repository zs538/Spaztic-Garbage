extends Node

@export var worldSpeed = 7
var playerLife = 3
var playerDashing = false
var playerInvincible = false
var playerScore = 0

func dash():
	playerDashing = true
	playerInvincible = true
	await get_tree().create_timer(0.3).timeout
	playerDashing = false
	await get_tree().create_timer(0.1).timeout
	playerInvincible = false

func getDamaged():
	if playerInvincible == false:
		playerInvincible = true
		playerLife -= 1
		await get_tree().create_timer(0.2).timeout
		playerInvincible = false
		
#func enemyGetDamaged(collidingEnemy):
	#collidingEnemy.queue_free()

func addScore(points):
	playerScore += points
