extends CanvasLayer

var herramienta_semillas_scene = preload("res://Escenas/herramienta_semillas.tscn")
var herramienta_regadera_scene = preload("res://Escenas/herramienta_regadera.tscn")
var herramienta_cosechar_scene = preload("res://Escenas/herramienta_cosechar.tscn")

func _on_boton_semillas_button_down() -> void:
	#instanciamos la bolsa
	var nueva_bolsa = herramienta_semillas_scene.instantiate()
	#la agregamos como hija del nivel
	get_parent().add_child(nueva_bolsa)
	#le damos la posicion del mouse a la nueva bolsa
	nueva_bolsa.global_position = nueva_bolsa.get_global_mouse_position()
	#busca el componente Drag and Drop de la bolsa y le damos true
	var componente_drag_and_drop = nueva_bolsa.get_node("D&dcomponent")
	componente_drag_and_drop.dragging = true
	


func _on_boton_regadera_button_down() -> void:
	var nueva_regadera = herramienta_regadera_scene.instantiate()
	get_parent().add_child(nueva_regadera)
	nueva_regadera.global_position = nueva_regadera.get_global_mouse_position()
	var componente_drag_and_drop = nueva_regadera.get_node("D&dcomponent")
	componente_drag_and_drop.dragging = true
	


func _on_boton_canasta_button_down() -> void:
	var nueva_canasta = herramienta_cosechar_scene.instantiate()
	get_parent().add_child(nueva_canasta)
	nueva_canasta.global_position = nueva_canasta.get_global_mouse_position()
	var componente_drag_and_drop = nueva_canasta.get_node("D&dcomponent")
	componente_drag_and_drop.dragging = true
