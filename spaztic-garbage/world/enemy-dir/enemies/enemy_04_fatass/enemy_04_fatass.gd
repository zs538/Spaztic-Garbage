extends EnemySc

var ePushed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemyHp = 2
	points = 500
	
func _process(delta: float) -> void:
	super._process(delta)
	if enemyHp == 1 and !ePushed:
		get_parent_node_3d().getPushed()
		ePushed = true
