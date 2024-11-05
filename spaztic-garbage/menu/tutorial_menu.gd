extends Control




func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/menu.tscn")


func _on_surrender_pressed() -> void:
	get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("back"):
		get_tree().change_scene_to_file("res://menu/menu.tscn")
