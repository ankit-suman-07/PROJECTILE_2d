extends Control

func _ready() -> void:
	$scoreLabel.text = "Your Score is : " + str(Global.score)
	


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_play_again_pressed() -> void:
	Global.score = 0
	Global.bullet = 10
	Global.gravity = 0.2
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_main_menu_pressed() -> void:
	Global.score = 0
	Global.bullet = 10
	Global.gravity = 0.2
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
