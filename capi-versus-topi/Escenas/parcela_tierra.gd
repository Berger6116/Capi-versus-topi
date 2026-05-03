extends Area2D
class_name ParcelaTierra

var planta_scene = preload("res://Escenas/planta_base.tscn")

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
	
