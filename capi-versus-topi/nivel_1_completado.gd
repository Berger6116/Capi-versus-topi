extends Control


func _on_siguiente_nivel_pressed() -> void:
	GameManager.resetear_para_nuevo_nivel()
	get_tree().change_scene_to_file("res://Escenas/tienda.tscn")
