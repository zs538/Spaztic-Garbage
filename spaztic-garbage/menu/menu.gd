extends Control

func _on_enter_pressed() -> void:
	get_tree().change_scene_to_file("res://world/main.tscn")

func _on_escape_pressed() -> void:
	get_tree().quit()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		get_tree().change_scene_to_file("res://world/main.tscn")
