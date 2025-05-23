extends RigidBody2D

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("bullets"):
		print("crash from target")


func _on_timer_timeout() -> void:
	self.queue_free()
