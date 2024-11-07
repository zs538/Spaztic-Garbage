extends Control




func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value/5)


func _on_toggled_button_pressed():
	
	if self.pressed:
		
		AudioServer.set_bus_mute(AudioServer.get_bus_index("AudioStreamPlayer"), true)
	else:
		
		AudioServer.set_bus_mute(AudioServer.get_bus_index("AudioStreamPlayer"), false)
