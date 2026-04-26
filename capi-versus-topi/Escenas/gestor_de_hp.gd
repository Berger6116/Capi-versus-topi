extends Area2D
class_name GestorDeHP

#VARIABLES
var max_hp: int
var actual_hp: int

#SEÑALES
signal impacto_recibido(hp: int)
signal muerte

#FUNCIONES
func _ready() -> void:
	#TOMA DEL NODO PADRE SU VARIABLE DE VIDA INICIAL
	max_hp = get_parent().vida
	actual_hp = max_hp
		
	#CUANDO LA VIDA LLEGA A 0 LE AVISA AL PADRE QUE EJECUTE LA FUNCION MORIR
	muerte.connect(get_parent().morir)

func recibir_danio(dmg: int) -> void:
	actual_hp -= dmg
	impacto_recibido.emit(actual_hp)
	print("Daño recibido! vida restante: ", actual_hp)
	chequear_muerte()
	
func chequear_muerte() -> void:
	if actual_hp <= 0:
		muerte.emit()
	
		
