extends Node3D

@export var enemies: Array[PackedScene] = []

func spawnEnemy(type, enemyPositionZ) -> void:
	var enemyToSpawn = enemies[type].instantiate()
	enemyToSpawn.position.x = 15
	enemyToSpawn.position.z = enemyPositionZ
	add_child(enemyToSpawn)

func nextEnemy():
	pass


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
