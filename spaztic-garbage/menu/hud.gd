extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$zivoty.text = "HP: " + str(worldValues.playerLife)
	$speed.text = "speed: " + str(worldValues.worldSpeed)
