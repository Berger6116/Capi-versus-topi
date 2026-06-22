extends Control
@onready var label_monedas_final: Label = $monedas
@onready var label_tomates_final: Label = $tomates
@onready var logro_nodo: Label = $logro
func _on_volve_a_intentar_pressed() -> void:
	GameManager.monedas = 0
	GameManager.topos_derrotados = 0
	GameManager.tomates_cosechados = 0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenas/nivel_1.tscn")


func _on_siguiente_nivel_pressed() -> void:
	GameManager.resetear_para_nuevo_nivel()
	get_tree().change_scene_to_file("res://Escenas/tienda.tscn")


func _ready() -> void:
	label_monedas_final.text = str(GameManager.monedas)
	label_tomates_final.text = str(GameManager.tomates_cosechados)
	logro_nodo.visible = true
	if GameManager.logro_20_plantas_desbloqueado:
		logro_nodo.text = "1 / 3"
	else:
		logro_nodo.text = "0 / 3"


func _on_ir_a_mapa_pressed() -> void:
	GameManager.resetear_para_nuevo_nivel() 
	get_tree().change_scene_to_file("res://mapa.tscn")
