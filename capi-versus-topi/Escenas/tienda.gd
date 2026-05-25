extends Node2D


func _on_texture_button_pressed() -> void:
	GameManager.tienda_comprar("canion_techo", 150)


func _on_texture_button_2_pressed() -> void:
	GameManager.tienda_comprar("semillas_poderosas", 50)
	

func _on_texture_button_3_pressed() -> void:
	GameManager.tienda_comprar("arma_mejorada", 100)


func _on_siguiente_nivel_pressed() -> void:
	#Pasa al nivel que guardamos en el Game Manager al momento de la victoria anterior
	get_tree().change_scene_to_file(GameManager.ruta_siguiente_nivel)
