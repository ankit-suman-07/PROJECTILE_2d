extends CharacterBody2D

const ROTATION_SPEED := 90.0  # degrees per second

func _process(delta):
	if Input.is_action_pressed("left"):
		rotation_degrees -= ROTATION_SPEED * delta
	elif Input.is_action_pressed("right"):
		rotation_degrees += ROTATION_SPEED * delta
