extends Node

@export var worldSpeed = 7
var playerDashing = false

func dash():
	playerDashing = true
	await get_tree().create_timer(0.5).timeout
	playerDashing = false
