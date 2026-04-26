extends Node2D

#NIVEL 1
@onready var camara: Camera2D = $Camera2D
@onready var spawner_topos: Marker2D = $SpawnerTopos

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
	
	animacion_camara.finished.connect(_on_paneo_finalizado)
	
func _on_paneo_finalizado() -> void:
	#encendemos el spawner cuando termina el paneo de cámara inicial
	spawner_topos.get_node("TimerOleada").start()
	print("inicia el spawner de topos")
	
	
