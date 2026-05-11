extends Node

#VARIABLES GLOBALES
var vidas_capi: int = 3
var topos_derrotados: int = 0
var monedas: int = 0

#SEÑALES
signal actualizar_vidas(cantidad: int)
signal actualizar_topos(cantidad: int)
signal actualizar_monedas(cantidad: int)
signal game_over

#FUNCIONES
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
	print("topos derrotados: ", topos_derrotados)
	
func sumar_monedas_huerta(cantidad: int):
	monedas += cantidad
	actualizar_monedas.emit(monedas)
	print("Monedas Actuales: ", monedas)

func activar_game_over():
	game_over.emit()
	print("oh no, los topos derrotaron a Capi")
	
			
