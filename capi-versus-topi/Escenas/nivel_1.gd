extends Node2D

#NIVEL 1
@onready var camara: Camera2D = $Camera2D
@onready var spawner_topos: Marker2D = $SpawnerTopos
@onready var mensajes: Label = $Mensajes/Mensajes_nivel
#Acá despues si va mas ordenado en un HUD se cambia esto:
@onready var botones_huerta = $MundoHuertaPrueba/BotonesHuerta/ContenedorFade

func _ready() -> void:
		
	GameManager.actualizar_topos.connect(chequear_victoria)
	
	#Fases del nivel 1: Huerta y luego oleada de topos
	await fase_huerta(20.0)
	await fase_oleada(5.0)
	
	#funcion movimiento de camara para iniciar oleada de topos
	animar_camara_inicio()
	
	
func animar_camara_inicio():
	#fade de botones huerta
	await fade_out(botones_huerta, 0.5)
	
	#movimiento de cámara:
	var posicion_original = camara.position
	var posicion_derecha = posicion_original + Vector2(1600, 0)
	var animacion_camara = create_tween()
	
	animacion_camara.tween_interval(1.0)
	animacion_camara.tween_property(camara, "position", posicion_derecha, 2.0).set_trans(Tween.TRANS_SINE)
	animacion_camara.tween_interval(1.0)
	animacion_camara.tween_property(camara, "position", posicion_original, 2.0).set_trans(Tween.TRANS_SINE)
	
	await animacion_camara.finished
	
	#fade in, vuelven los botones huerta:
	fade_in(botones_huerta, 0.5)

func mostrar_mensaje(msj: String) -> void:
	mensajes.text = msj
	mensajes.show()
	await get_tree().create_timer(3.0).timeout
	mensajes.hide()

func fase_huerta (tiempo: float) -> void:
	mostrar_mensaje("Tienes 15 segundos para plantar!!!")
	await get_tree().create_timer(tiempo).timeout

func fase_oleada (tiempo: float) -> void:
	mostrar_mensaje("Cuidado que vienen los topos!!!")
	spawner_topos.get_node("TimerOleada").start()	
	await get_tree().create_timer(tiempo).timeout
	
func fade_out(nodo: Node, tiempo: float) ->void:
	nodo.show()
	var fadeOut = create_tween()
	fadeOut.tween_property(nodo, "modulate:a", 0.0, tiempo).set_trans(Tween.TRANS_SINE)
	await fadeOut.finished
	nodo.hide()
	
func fade_in(nodo: Node, tiempo: float) ->void:
	nodo.modulate.a = 0.0
	nodo.show()
	var fadeIn = create_tween()
	fadeIn.tween_property(nodo, "modulate:a", 1.0, tiempo).set_trans(Tween.TRANS_SINE)
	
	

func chequear_victoria (topos_muertos: int) -> void:
	
	if topos_muertos >= 10:
		#print("Lograste la victoria! mataste 10 topos!")
		var timer = spawner_topos.get_node("TimerOleada")
		if timer != null:
			timer.stop()
		#señal para eliminar topos restantes:
		spawner_topos.eliminar_topos_restantes.emit()
		#mostrar cartel de victoria:
		mensajes.text = "Nivel 1 completado!!!"
		mensajes.show()
