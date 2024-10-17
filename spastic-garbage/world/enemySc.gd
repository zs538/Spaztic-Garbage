extends Node3D

@onready var spawn = $"../"

var speed = 7

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed*delta
	if position.x < -1:
		spawn.spawnEnemy()
		queue_free()
