#extends CharacterBody2D
#class_name Bullet
#
#@export var speed := 800.0
#var direction := Vector2.ZERO
#
#func initialize(dir: Vector2):
	#direction = dir
#
#func _physics_process(delta):
	#position += direction * speed * delta

extends CharacterBody2D
class_name Bullet

var score := 0

@export var speed := 800.0
var direction := Vector2.ZERO
var has_collided := false  # Flag to ensure we print only once

func initialize(dir: Vector2):
	direction = dir.normalized()

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if has_collided:
		return
	
	if collision:
		if collision.get_collider().is_in_group("targets"):
			has_collided = true
			score += 1
			Global.score += score
			print("crash : " + str(Global.score))
			$Crash.play()
