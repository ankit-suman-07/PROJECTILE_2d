extends CharacterBody2D
class_name Bullet

var score := 0
var bullet := 10

@export var speed := 800.0
var direction := Vector2.ZERO
var has_collided := false  # Flag to ensure we print only once

func initialize(dir: Vector2):
	direction = dir.normalized()
	
	print(Global.bullet)

func _physics_process(delta):
	
	var collision = move_and_collide(direction * speed * delta)
	if has_collided:
		return
	
	if collision:
		if collision.get_collider().is_in_group("targets"):
			has_collided = true
			score += 1
			Global.score += score
			var label = get_parent().get_node("Score")
			label.text = "Score : " + str(Global.score)
			print("crash : " + str(Global.score))
			$Crash.play()
		
		if collision.get_collider().is_in_group("add_bullets"):
			has_collided = true
			Global.bullet += bullet
			var label = get_parent().get_node("BulletCountLabel")
			label.text = "Bullet left : " + str(Global.bullet)
			print("crash : " + str(Global.bullet))
			$Crash.play()
