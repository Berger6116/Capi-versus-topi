extends Node

var vidas_capi: int = 3
var topos_derrotados= 0

func restar_vida():
	vidas_capi-= 1
	print("¡Ho no, Capi perdió una vida! le quedan: ",vidas_capi)
	
	if vidas_capi <= 0:
		activar_game_over()
		
func sumar_puntaje(puntos: int):
	topos_derrotados += puntos
	prints("topos derrotados: ", topos_derrotados)

func activar_game_over():
	print("Ho no, los topos derrotaron a Capi ")
	
			
