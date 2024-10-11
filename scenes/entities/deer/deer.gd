extends CharacterBody3D
class_name Deer

const SPEED = 5.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
