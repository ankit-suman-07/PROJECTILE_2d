extends Control



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_control_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/control.tscn")
