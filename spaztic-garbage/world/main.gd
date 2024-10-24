extends Node3D

var shouldSpawn = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shouldSpawn:
		shouldSpawn = false
		var enemyType = spawn.enemyValue(true)
		var enemyPosition = spawn.enemyValue(false)
		spawn.spawnEnemy(enemyType, enemyPosition)
		patterns.nextEnemy()
		await get_tree().create_timer(0.4).timeout
		shouldSpawn = true
