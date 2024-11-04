extends Control

func _process(delta: float) -> void:
	$Label.text = "score: " + str(worldValues.playerScore)
