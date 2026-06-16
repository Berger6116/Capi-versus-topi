extends Node

#VARIABLES GLOBALES
var topos_derrotados: int = 0
var monedas: int = 0
var plantas_destruidas: int = 0
var limite_de_plantas_para_perder : int= 50 #Si topi rompe 50 plantas Capi pierde
var tomates_cosechados: int = 0
var ruta_siguiente_nivel: String = ""
var topos_muertos_por_nivel: int = 10 #Acá puse la cantidad del nivel 1
var mensaje_derrota: String = ""

#Diccionario de mejoras para comprar con monedas:
var mejoras_desbloqueadas: Dictionary ={
	"canion_techo": false,
	"semillas_poderosas": false, # inventar planta nueva
	"arma_mejorada": false # inventar arma nueva
}
#diccionario para los precios:
var precios_mejoras: Dictionary={
	"canion_techo": 150,
	"semillas_poderosas": 100, # inventar planta nueva
	"arma_mejorada": 100 # inventar arma nueva
}

#SEÑALES
signal actualizar_vida_capi(hp_actual: int)
signal actualizar_topos(cantidad: int) 
signal actualizar_monedas(cantidad: int)
signal game_over



#Aca vienen las funciones
func registrar_planta_destruida() -> void:
	plantas_destruidas += 1
	var plantas_instanciadas = get_tree().get_nodes_in_group("plantas").size()
	if plantas_destruidas >= limite_de_plantas_para_perder and plantas_instanciadas <=1:
		mensaje_derrota = "Perdiste! los topos destrozaron demasiadas plantas!"
		activar_game_over()
		
func activar_game_over() -> void:
	plantas_destruidas= 0
	monedas = 0
	limpiar_mejoras()
	game_over.emit()
	get_tree().call_deferred("change_scene_to_file", "res://perdiste.tscn")
	
		
#SEPARO EL PUNTAJE DE TOPOS DERROTADOS DE LAS MONEDAS QUE VA A DAR LA HUERTA
func sumar_puntaje_topos():
	topos_derrotados += 1
	actualizar_topos.emit(topos_derrotados)
	#print("topos derrotados: ", topos_derrotados)
	
func sumar_monedas_huerta(cantidad: int):
	monedas += cantidad
	actualizar_monedas.emit(monedas)
	print("Monedas Actuales: ", monedas)

func resetear_para_nuevo_nivel():
	topos_derrotados = 0
	plantas_destruidas = 0
	topos_muertos_por_nivel = 0
	print("variables topos y plantas derrotados a CERO")
	
func tienda_comprar(item: String) -> bool:
	var precio = precios_mejoras[item]
	
	if monedas >= precio and mejoras_desbloqueadas[item] == false:
		monedas -= precio
		mejoras_desbloqueadas[item] = true
		actualizar_monedas.emit(monedas)
		print("Compra exitosa! Desbloqueaste: ", item)
		return true
	else:
		print("No tenes suficientes monedas o ya lo tenes")
		return false
		
func limpiar_mejoras() -> void:
	for item in mejoras_desbloqueadas:
		mejoras_desbloqueadas[item] = false
		
