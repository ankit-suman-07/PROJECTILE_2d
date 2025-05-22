extends CharacterBody2D

const ROTATION_SPEED := 150.0  # degrees per second
const GRAVITY := 1200.0       # pixels per second squared
const MIN_ROTATION := -60.0   # Left rotation limit
const MAX_ROTATION := 60.0    # Right rotation limit

@export var bullet_scene: PackedScene

#func _physics_process(delta):
	#velocity.y += GRAVITY * delta
	#move_and_slide()

func _process(delta):
	if Input.is_action_pressed("left"):
		rotation_degrees -= ROTATION_SPEED * delta
	elif Input.is_action_pressed("right"):
		rotation_degrees += ROTATION_SPEED * delta

	# Clamp the rotation so it stays between MIN and MAX
	rotation_degrees = clamp(rotation_degrees, MIN_ROTATION, MAX_ROTATION)
	
	if Input.is_action_just_pressed("shoot"):  # Ensure "shoot" is mapped to "x"
		shoot()

func shoot():
	if bullet_scene:
		var bullet = bullet_scene.instantiate()
		print(bullet.name)
		var spawn_point = $BulletSpawnPoint.global_position
		var direction = Vector2.UP.rotated(global_rotation)  # Shoot in the facing direction

		bullet.global_position = spawn_point
		if bullet.has_method("initialize"):
			bullet.initialize(direction)
 
		get_tree().current_scene.add_child(bullet)
		# Play shoot sound
		$ShootSound.play()
