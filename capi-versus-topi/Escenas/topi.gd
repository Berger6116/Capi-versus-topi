extends CharacterBody2D

var velocidad : float =100.0
var salud: int = 3

func _physics_process(delta: float) -> void:
	velocity.x = -velocidad
	move_and_slide()
	
func recibir_dano (cantidad:int):
	salud-=cantidad
	
	if salud <= 0:
		GameManager.sumar_puntaje (10)
		queue_free()
