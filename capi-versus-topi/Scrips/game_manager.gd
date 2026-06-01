extends Node

#VARIABLES GLOBALES
var vidas_capi: int = 3
var topos_derrotados: int = 0
var monedas: int = 0
var plantas_destruidas: int = 0
var limite_de_plantas_para_perder : int= 10 #Si topi rompe 10 plantas Capi pierde
var tomates_cosechados: int = 0

#SEÑALES
signal actualizar_vidas(cantidad: int)
signal actualizar_topos(cantidad: int) 
signal actualizar_monedas(cantidad: int)
signal game_over


#Aca vienen las funciones
func registrar_planta_destruida() -> void:
	plantas_destruidas += 1
	
	if plantas_destruidas >= limite_de_plantas_para_perder:
		activar_game_over()
		
func activar_game_over() -> void:
	plantas_destruidas= 0
	game_over.emit()
	get_tree().change_scene_to_file("")
	


func restar_vida():
	vidas_capi -= 1
	actualizar_vidas.emit(vidas_capi)
	print("¡oh no, Capi perdió una vida! le quedan: ",vidas_capi)
	
	if vidas_capi <= 0:
		activar_game_over()
		
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
	print("variables topos y plantas derrotados a CERO")
	
func tienda_comprar(item: String, precio: int) -> bool:
	if monedas >= precio and mejoras_desbloqueadas[item] == false:
		monedas -= precio
		mejoras_desbloqueadas[item] = true
		actualizar_monedas.emit(monedas)
		print("Compra exitosa! Descloqueaste: ", item)
		return true
	else:
		print("No tenes suficientes monedas o ya lo tenes")
		return false
		
