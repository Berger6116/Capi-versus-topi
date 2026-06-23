extends Control

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/munu.tscn")


func _on_boton_1_pressed() -> void:
	GameManager.resetear_para_nuevo_nivel()
	get_tree().change_scene_to_file("res://Escenas/nivel_1.tscn")


func _on_boton_2_pressed() -> void:
	GameManager.resetear_para_nuevo_nivel()
	get_tree().change_scene_to_file("res://Escenas/nivel_2.tscn")
