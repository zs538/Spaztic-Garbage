extends Node3D

@export var enemies: Array[PackedScene] = []

func _ready() -> void:
	enemies.append(preload("res://world/enemy-dir/enemy.tscn"))

func spawnEnemy(type, enemyPositionZ) -> void:
	var enemyToSpawn = enemies[type].instantiate()
	enemyToSpawn.position.x = 15
	enemyToSpawn.position.z = enemyPositionZ
	add_child(enemyToSpawn)

func enemyValue(infoType):
	if patterns.patternSelected == false:
		patterns.selectPattern()

	var currentEnemy = patterns.getCurrentEnemy()
	patterns.nextEnemy()

	if infoType:
		return currentEnemy[0]
	else:
		return currentEnemy[1]


#var index = 1
#var patternSelected = false
#var patternToFollow = []
#
	#if position.x < -1:
		#if patternSelected:
			#queue_free()
			#
			#var tempArray = patternToFollow[index]
			#spawn.spawnEnemy(tempArray[0], tempArray[1])
			#if index < patternToFollow.size():
				#index = 2
			#else:
				#patternSelected = false
		#else:
			##index = 0
			#patternSelected = true
			#patternToFollow = returnPattern()
