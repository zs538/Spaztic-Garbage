extends EnemyMoveScript

@onready var enemyPositionZ = position.z
var didShoot = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if position.x <= 6 and !didShoot:
		spawn.spawnEnemy(patterns.BULLET,enemyPositionZ,6)
		didShoot = true
