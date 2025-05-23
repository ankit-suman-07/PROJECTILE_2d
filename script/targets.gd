extends RigidBody2D

func _ready() -> void:
	gravity_scale = Global.gravity
	print("Gravity :-> " + str(mass))

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("bullets"):
		print("crash from target")


func _on_timer_timeout() -> void:
	self.queue_free()
