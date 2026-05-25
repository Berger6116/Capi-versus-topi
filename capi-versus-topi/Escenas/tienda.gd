extends Node2D


func _on_texture_button_pressed() -> void:
	GameManager.tienda_comprar("canion_techo", 150)


func _on_texture_button_2_pressed() -> void:
	GameManager.tienda_comprar("semillas_poderosas", 50)
	

func _on_texture_button_3_pressed() -> void:
	GameManager.tienda_comprar("arma_mejorada", 100)
