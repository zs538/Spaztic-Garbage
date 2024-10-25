extends Node3D

var speed = worldValues.worldSpeed * 5
var dieBullet = false

func bulletDeath():
	dieBullet = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x += speed*delta
		
	if position.x >= 60 or dieBullet:
		queue_free()
