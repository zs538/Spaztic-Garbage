extends EnemySc

func shoot():
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemyHp = 1
	points = 200

func _process(delta: float) -> void:
	if position.x <= 6:
		shoot()
