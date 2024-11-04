extends Control

func _on_restard_pressed() -> void:
	get_tree().change_scene_to_file("res://world/main.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/menu.tscn")

func _ready() -> void:
	worldValues.load_score()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		get_tree().change_scene_to_file("res://world/main.tscn")
		
	$hscore.text = "high score: " + str(worldValues.highScore)
