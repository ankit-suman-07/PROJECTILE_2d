extends StaticBody2D

@export var speed := 600.0
var direction := Vector2.ZERO

func initialize(dir: Vector2):
	direction = dir

func _physics_process(delta):
	position += direction * speed * delta
