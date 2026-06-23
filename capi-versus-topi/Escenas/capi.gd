extends CharacterBody2D

class_name Capi

var vida: int = 100
var disparo_capi = preload("res://Escenas/disparo_capi.tscn")

@onready var timer_disparo: Timer = $TimerDisparo

var topos_en_area_vision: int = 0

#agregado_variable para disparo manual
var puede_disparar_manual: bool = true

func _ready() -> void:
	#$GestorDeHp.impacto_recibido.connect(_on_gestor_de_hp_impacto_recibido)
	#$GestorDeHp.body_entered.connect(_on_gestor_de_hp_body_entered)
	pass

#agrgado_manual con barra espaciadora
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("disparar") and puede_disparar_manual:
		puede_disparar_manual = false
		disparar()
		# Esperar 0.5 segundos antes de poder disparar otra vez
		await get_tree().create_timer(0.5).timeout
		puede_disparar_manual = true


#FUNCION QUE SE ACTIVA CUANDO ALGO ENTRA EL EL AREA DE VISION DEL CAPI:
func _on_area_vision_body_entered(body: Node2D) -> void:
	#print(body.name, " entró en el area!!")
	if body is Topi:
		#print("Entra al if detecta al topi y enciende timer")
		topos_en_area_vision += 1
		if timer_disparo.is_stopped():
			timer_disparo.start()


#SE EJECUTA CUANDO ALGO SALE DEL AREA DEL PASTO:
func _on_area_vision_body_exited(body: Node2D) -> void:
	if body is Topi:
		topos_en_area_vision -= 1
		if topos_en_area_vision <= 0:
			timer_disparo.stop()
		


func _on_timer_disparo_timeout() -> void:
	#disparar()
	pass
	
func disparar() -> void:
	#print("Capi disparando...")
	if disparo_capi != null:
		var nuevo_disparo_capi = disparo_capi.instantiate()
		nuevo_disparo_capi.global_position = global_position
		get_parent().add_child(nuevo_disparo_capi)
		#print("fin del disparo")
		$SonidoDisparo.play()
	

func morir() -> void:
	#print("Capi murió... Game Over!!!")
	GameManager.mensaje_derrota = "Perdiste! Capi se quedó sin fuerza para defender la huerta!"
	GameManager.activar_game_over()
	queue_free()


func _on_gestor_de_hp_impacto_recibido(hp: int) -> void:
	GameManager.actualizar_vida_capi.emit(hp)


func _on_gestor_de_hp_body_entered(body: Node2D) -> void:
	if body is Topi:
		GameManager.mensaje_derrota = "Perdiste! Los topos invadieron la huerta!"
		GameManager.activar_game_over()
