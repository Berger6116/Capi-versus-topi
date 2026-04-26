extends DisparoBase

class_name DisparoCapi

func _ready() -> void:
	#SUPER READY EJECUTA EL CODIGO DE LA CLASE PADRE, SE BORRA AL SALIR DE LA PANTALLA
	super._ready()
	
	#PERSONALIZAMOS LOS VALORES DEL DISPARO:
	velocidad = 350.0
	danio = 10
	


func _physics_process(delta: float) -> void:
	#El disparo del capi va hacia la derecha hasta que choca con el topi
	global_position.x += velocidad * delta
	
	
