extends Marker2D

#CREAMOS LA FABRICA DE ENEMIGOS
var fabrica = FactoryEnemigos.new()
#NIVEL DE DIFICULTAD
var dificultad_actual = 1

func _ready() -> void:
	#CONECTAMOS EL TIMER
	$TimerOleada.timeout.connect(_on_timer_timeout)
	
func _on_timer_timeout() -> void:
	generar_topo()
	
func generar_topo() -> void:
	#LE INDICAMOS A LA FABRICA QUE CREE UN ENEMIGO
	var nuevo_enemigo = fabrica.crear_enemigo(dificultad_actual)
	
	#SI SE CREO UN ENEMIGO LO UBICAMOS EN LA ESCENA:
	if nuevo_enemigo != null:
		#LO COLOCAMOS DONDE ESTÁ EL MARKER2D
		nuevo_enemigo.global_position = global_position
		
		#LO AGREGAMOS COMO HIJO DEL NIVEL 1
		get_parent().add_child(nuevo_enemigo)
