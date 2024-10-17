extends Node3D

var speed = 7

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed*delta
	if position.x <= -1:
		var enemyType = spawn.enemyValue(true)
		var enemyPosition = spawn.enemyValue(false)
		spawn.spawnEnemy(enemyType, enemyPosition)
		queue_free()