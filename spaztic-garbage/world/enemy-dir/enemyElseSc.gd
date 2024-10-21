extends "res://world/enemy-dir/enemySc.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

var enemyHp
var points

func enemyGetDamaged():
	enemyHp -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
	
	if enemyHp < 1:
		worldValues.addScore(points)
		queue_free()
