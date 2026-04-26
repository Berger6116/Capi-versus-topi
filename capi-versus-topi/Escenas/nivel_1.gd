extends Node2D

#NIVEL 1
@onready var camara: Camera2D = $Camera2D

func _ready() -> void:
	#funcion movimiento de camara
	animar_camara_inicio()
	
	
func animar_camara_inicio():
	
	var posicion_original = camara.position
	
	var posicion_derecha = posicion_original + Vector2(1600, 0)
	var animacion_camara = create_tween()
	
	animacion_camara.tween_interval(1.0)
	
	animacion_camara.tween_property(camara, "position", posicion_derecha, 2.0).set_trans(Tween.TRANS_SINE)
	
	animacion_camara.tween_interval(1.0)
	
	animacion_camara.tween_property(camara, "position", posicion_original, 2.0).set_trans(Tween.TRANS_SINE)
	
	
