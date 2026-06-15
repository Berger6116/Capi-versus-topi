extends CharacterBody2D

class_name Topi 

#variables
var escena_disparo_topi = preload("res://Escenas/disparo_topi.tscn")
var vida: int= 30
var velocidad_actual: float = -80.0
var estar_enojado: bool = false
var carriles_y: Array[float] = [695.0,735.0,775.0] #Acá cambian de carril,  Posición de las parcelas
var ajuste_visual_y: float = -30.0
var planta_actual: PlantaBase = null
var gestorHp_planta_actual: Area2D = null
var danio_mordida: int = 10

#Funciones
func _ready() -> void: #Con esto nuevo bajan tomando en cuenta las parcelas y se acomodan visualmente
	global_position.y = carriles_y.pick_random() + ajuste_visual_y 
	#$GestorDeHp.area_entered.connect(_on_gestor_de_hp_area_entered)
	#$GestorDeHp.area_exited.connect(_on_gestor_de_hp_area_exited)

func _physics_process(delta: float) -> void:
	if planta_actual != null:
		velocity.x = 0
	else:
		velocity.x = velocidad_actual
	move_and_slide()
	
	if vida <= 10 and not estar_enojado:
		ponerse_rojo()
		
#Acá llama a TimerAtaque
func _on_timer_ataque_timeout() -> void:
	if planta_actual != null:
		morder_planta()
	else:
		disparar()
	
func disparar() -> void:
	var bala = escena_disparo_topi.instantiate()
	bala.global_position = global_position
	get_tree().current_scene.add_child(bala)

func morder_planta() -> void:
	if is_instance_valid(gestorHp_planta_actual):
		print("El topo está mordiendo la planta")
		gestorHp_planta_actual.recibir_danio(danio_mordida)
	
func recibir_danio(dmg: int) -> void:
	vida-= dmg
	print("Topi recibió daño. Vida restante; ", vida)
	
func ponerse_rojo() -> void:
	estar_enojado = true
	velocidad_actual = -150.0
	
	var tween = create_tween() #NUEVO TWEEN QUE AL FIN FUNCIONAAAA!!!
	tween.tween_property($Sprite2D,"modulate", Color(1,0,0),0.5)
	print("Al fin se calentó este pecho fríooo")
	
func morir() -> void:
	print ("Topi derrotado")
	
	GameManager.sumar_puntaje_topos()
	queue_free()

func eliminar_todos_los_topos() -> void:
	#los topos se eliminan al terminar el nivel
	queue_free()

func _on_gestor_de_hp_area_entered(area: Area2D) -> void:
	if area.get_parent() is PlantaBase:
		planta_actual = area.get_parent()
		gestorHp_planta_actual = area
		$TimerAtaque.stop()
		empezar_a_morder()

func empezar_a_morder() -> void:
	while planta_actual != null and is_instance_valid(gestorHp_planta_actual):
		morder_planta()
		await get_tree().create_timer(1.0).timeout

func _on_gestor_de_hp_area_exited(area: Area2D) -> void:
	if area.get_parent() == planta_actual:
		planta_actual = null
		gestorHp_planta_actual = null
		$TimerAtaque.start()
