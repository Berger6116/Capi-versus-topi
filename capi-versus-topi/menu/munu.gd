extends Control

func _on_texture_button_3_pressed():
	get_tree().change_scene_to_file("res://credito/credito.tscn")


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/nivel_1.tscn")
