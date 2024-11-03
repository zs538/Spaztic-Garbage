extends Node3D

@export var enemies: Array[PackedScene] = []

func _ready() -> void:
	#space
	enemies.append(preload("res://world/enemy-dir/enemies/enemy_00_Empty/enemy_00_empty.tscn"))
	#enemies
	enemies.append(preload("res://world/enemy-dir/fire.tscn"))
	enemies.append(preload("res://world/enemy-dir/enemies/enemy_01_tard/enemy_01_tard.tscn"))
	enemies.append(preload("res://world/enemy-dir/enemies/enemy_02_mewtard/enemy_02L_mewtard.tscn"))
	enemies.append(preload("res://world/enemy-dir/enemies/enemy_02_mewtard/enemy_02R_mewtard.tscn"))
	enemies.append(preload("res://world/enemy-dir/enemies/enemy_03_xioetr/enemy_03_xioetr.tscn"))
	enemies.append(preload("res://world/enemy-dir/enemies/enemy_03_xioetr/enemyBullet.tscn"))
	enemies.append(preload("res://world/enemy-dir/enemies/enemy_04_fatass/enemy_04_fatass.tscn"))
	#powerups
	enemies.append(preload("res://world/powerup/sproke.tscn"))
	enemies.append(preload("res://world/powerup/meds.tscn"))
#
#func enemyShoot(enemyPositionZ):
	#var bulletToSpawn = enemies[patterns.BULLET].instantiate()
	#bulletToSpawn.position.x = 6
	#bulletToSpawn.position.z = enemyPositionZ
	#add_child(bulletToSpawn)
#
#func spawnEnemy(type, enemyPositionZ = 0, enemyPositionX = 15) -> void:
	#var enemyToSpawn = enemies[type].instantiate()
	#enemyToSpawn.position.x = enemyPositionX
	#enemyToSpawn.position.z = enemyPositionZ
	#add_child(enemyToSpawn)
#
#func enemyValue(infoType):
	#if patterns.patternSelected == false:
		#patterns.selectPattern()
#
	#var currentEnemy = patterns.getCurrentEnemy()
#
	#if infoType:
		#return currentEnemy[0]
	#else:
		#return currentEnemy[1]
