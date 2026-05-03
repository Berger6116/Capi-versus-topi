extends Node
class_name HerramientaHuertaBase

func soltar_herramienta() -> void:
	var areas_tocadas = $Detector.get_overlapping_areas()
	
	for area in areas_tocadas:
		if area is ParcelaTierra:
			# si es una parcela de tierra, aplica la herramienta y la borra:
			aplicar_herramienta(area)
			
			queue_free()
			return
	print("acá no hay tierra para usar la herramienta")
	queue_free()

#función que cada clase hija va a tener que aplicar:
func aplicar_herramienta(parcela: ParcelaTierra) -> void:
	pass
