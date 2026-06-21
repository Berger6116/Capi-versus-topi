extends Area2D
class_name ParcelaTierra

var planta_scene = preload("res://Escenas/planta_base.tscn")
var escudo_scene = preload("res://Escenas/escudo.tscn")

var planta_actual: Node2D = null


func _ready() -> void:
	pass

func sembrar() -> void:
	#si la parcela esta vacia plantamos la semilla:
	if planta_actual == null:
		planta_actual = planta_scene.instantiate()
		#va como hijo de la parcela para que crezca en el mismo lugar:
		add_child(planta_actual)
	else:
		print("ya hay una planta acá")

func regar() -> void:
	if planta_actual != null:
		planta_actual.regar()
	else:
		print("error al regar")
		
func cosechar() -> void:
	if planta_actual != null:
		var se_cosecho = planta_actual.cosechar()
	
		if se_cosecho:
			planta_actual.queue_free()
			planta_actual = null
		else:
			print("no se pudo cosechar")
			
func colocar_escudo() -> void: #Con esta función se coloca la valla, aunque algo salió mal, revisar
	if planta_actual == null:
		planta_actual = escudo_scene.instantiate()#Lógica igual a sembrar, pero no quiere funcionar!!
		add_child(planta_actual)
		print ("valla colocada en la parcela")

	else:
		print("No lo pongas acá hay algo")
