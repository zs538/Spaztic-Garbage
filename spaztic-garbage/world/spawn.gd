extends Node3D

@export var enemies: Array[PackedScene] = []

func _ready() -> void:
	enemies.append(preload("res://world/enemy-dir/enemy.tscn"))
	enemies.append(preload("res://world/enemy-dir/enemy_hexsaw.tscn"))
	enemies.append(preload("res://world/enemy-dir/enemy_01_tard.tscn"))

func spawnEnemy(type, enemyPositionZ) -> void:
	var enemyToSpawn = enemies[type].instantiate()
	enemyToSpawn.position.x = 15
	enemyToSpawn.position.z = enemyPositionZ
	add_child(enemyToSpawn)

func enemyValue(infoType):
	if patterns.patternSelected == false:
		patterns.selectPattern()

	var currentEnemy = patterns.getCurrentEnemy()

	if infoType:
		return currentEnemy[0]
	else:
		return currentEnemy[1]
