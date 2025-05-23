extends Control

func _ready() -> void:
	$Line2D.default_color = Color.html(Global.color)

func _on_red_pressed() -> void:
	Global.color = "#ff0000"  # semi-transparent red
	$Line2D.default_color = Color.html(Global.color)

func _on_blue_pressed() -> void:
	Global.color = "#3333ff33"  # semi-transparent blue
	$Line2D.default_color = Color.html(Global.color)

func _on_yellow_pressed() -> void:
	Global.color = "#cccc3333"  # semi-transparent yellow
	$Line2D.default_color = Color.html(Global.color)

func _on_green_pressed() -> void:
	Global.color = "#33cc3333"  # semi-transparent green
	$Line2D.default_color = Color.html(Global.color)

func _on_purple_pressed() -> void:
	Global.color = "#9933cc33"  # semi-transparent purple
	$Line2D.default_color = Color.html(Global.color)

func _on_orange_pressed() -> void:
	Global.color = "#ff993333"  # semi-transparent orange
	$Line2D.default_color = Color.html(Global.color)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
