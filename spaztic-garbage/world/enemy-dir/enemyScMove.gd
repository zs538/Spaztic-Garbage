extends Node3D

class_name EnemyMoveScript

var speed = worldValues.worldSpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if worldValues.playerDashing:
		position.x -= speed*delta*3
	else:
		position.x -= speed*delta
	
	if position.x <= -1:
		var enemyType = spawn.enemyValue(true)
		var enemyPosition = spawn.enemyValue(false)
		spawn.spawnEnemy(enemyType, enemyPosition)
		patterns.nextEnemy()
		queue_free()
