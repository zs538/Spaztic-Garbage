extends Node3D

class_name main
#
#func enemyShoot(enemyPositionZ):
	#var bulletToSpawn = spawn.enemies[patterns.BULLET].instantiate()
	#bulletToSpawn.position.x = 6
	#bulletToSpawn.position.z = enemyPositionZ
	#add_child(bulletToSpawn)

func spawnEnemy(type, enemyPositionZ = 0, enemyPositionX = 15) -> void:
	var enemyToSpawn = spawn.enemies[type].instantiate()
	enemyToSpawn.position.x = enemyPositionX
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

var shouldSpawn = true
var spawnDelay = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	worldValues.playerLife = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawnDelay = 2.8 / worldValues.worldSpeed
	
	if shouldSpawn:
		shouldSpawn = false
		var enemyType = enemyValue(true)
		var enemyPosition = enemyValue(false)
		spawnEnemy(enemyType, enemyPosition)
		patterns.nextEnemy()
		await get_tree().create_timer(spawnDelay).timeout
		shouldSpawn = true
	
	if worldValues.playerLife <= 0:
		get_tree().change_scene_to_file("res://world/main.tscn")
