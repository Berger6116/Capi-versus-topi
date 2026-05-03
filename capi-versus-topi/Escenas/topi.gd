extends CharacterBody2D
#RECORDAR: ESTAN MUY GRANDES LOS SPRITES, 
#SI LOS ACHICAMOS VOLVER A ESCALAR AL TOPI DESDE EL CHARACTERBODY
#AHORA ESTA EN 0.4 SCALE
class_name Topi

var vida: int = 30
#var estar_enojado: bool= false
var velocidad_actual:float = -80.0

func _physics_process(delta: float) -> void:
	#velocity = Vector2(-80, 0)
	velocity.x= velocidad_actual
	move_and_slide()
#	if vida <= 20 and not estar_enojado:
#		ponerse_rojo()

#func ponerse_rojo():
#	estar_enojado = true
#	velocidad_actual= -100.0
	
#	var tween=create_tween()#efecto visual, cambia a rojo
#	tween.tween_property($Sprite2D, "modulate", Color (1,0,0),0.5)
#	print("Topi se enojó y ahora corre más rápido") 

func morir() -> void:
	print("Topi derrotado!")
	#AVISA AL GAME MANAGER SUMAR PUNTAJE
	GameManager.sumar_puntaje_topos()
	queue_free()
