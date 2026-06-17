extends HerramientaHuertaBase

func aplicar_herramienta(parcela: ParcelaTierra) -> void:
	parcela.cosechar()

func puede_aplicarse_en(parcela: ParcelaTierra) -> bool:
	if parcela.planta_actual != null and parcela.planta_actual is PlantaBase:
		# ...brilla SOLO si la planta está en fase COSECHABLE
		return parcela.planta_actual.fase_actual == PlantaBase.FasePlanta.COSECHABLE
	
	return false
