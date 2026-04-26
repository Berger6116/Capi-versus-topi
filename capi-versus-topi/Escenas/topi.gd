extends CharacterBody2D

class_name Topi

var vida: int = 30

func _physics_process(delta: float) -> void:
	velocity = Vector2(-80, 0)
	move_and_slide()
	
func morir() -> void:
	print("Topi derrotado!")
	queue_free()
