extends Node3D

var shouldSpawn = true
var spawnDelay = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawnDelay = 2.8 / worldValues.worldSpeed
	
	if shouldSpawn:
		shouldSpawn = false
		var enemyType = spawn.enemyValue(true)
		var enemyPosition = spawn.enemyValue(false)
		spawn.spawnEnemy(enemyType, enemyPosition)
		patterns.nextEnemy()
		await get_tree().create_timer(spawnDelay).timeout
		shouldSpawn = true
