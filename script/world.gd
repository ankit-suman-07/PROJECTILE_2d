extends Node2D

@export var target_scene: PackedScene
@export var add_bullet_scene: PackedScene

var markers := []

func _ready():
	print_tree()
	
	# Collect all Marker2D nodes in the scene
	for child in $TargetMarkers.get_children():
		if child is Marker2D:
			markers.append(child)

	$Timer.timeout.connect(_on_timer_timeout)
	$TimerAddBullet.timeout.connect(_on_timer_timeout_add_bullet)
	
func _process(delta: float) -> void:
	if Global.bullet <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_timer_timeout():
	if target_scene and markers.size() > 0:
		var marker = markers[randi() % markers.size()]
		var bullet = target_scene.instantiate()
		print(bullet.name)
		bullet.global_position = marker.global_position
		get_tree().current_scene.add_child(bullet)

func _on_timer_timeout_add_bullet():
	if add_bullet_scene and markers.size() > 0:
		var marker = markers[randi() % markers.size()]
		var bullet = add_bullet_scene.instantiate()
		print(bullet.name)
		bullet.global_position = marker.global_position
		get_tree().current_scene.add_child(bullet)
	


func _on_gravity_increment_timer_timeout() -> void:
	Global.gravity += 0.05
