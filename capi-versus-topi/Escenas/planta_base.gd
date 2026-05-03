extends Node2D
class_name PlantaBase

#Fases de las plantas:
enum FasePlanta { BROTE, CRECIENDO, COSECHABLE }

var fase_actual: FasePlanta = FasePlanta.BROTE

#IMAGENES:
@onready var sprite_brote: Sprite2D = $SpriteBrote
@onready var sprite_creciendo: Sprite2D = $SpriteCreciendo
@onready var sprite_cosechable: Sprite2D = $SpriteCosechable


func _ready() -> void:
	actualizar_dibujo()
	
func actualizar_dibujo() -> void:
	sprite_brote.hide()
	sprite_creciendo.hide()
	sprite_cosechable.hide()
	
	match fase_actual:
		FasePlanta.BROTE:
			sprite_brote.show()
			print("planta brote")
		FasePlanta.CRECIENDO:
			sprite_creciendo.show()
			print("planta creciendo")
		FasePlanta.COSECHABLE:
			sprite_cosechable.show()
			print("planta cosechable")
			
func regar() -> void:
	if fase_actual == FasePlanta.BROTE:
		fase_actual = FasePlanta.CRECIENDO
		actualizar_dibujo()
		GameManager.sumar_monedas_huerta(10)
	elif fase_actual == FasePlanta.CRECIENDO:
		fase_actual = FasePlanta.COSECHABLE
		GameManager.sumar_monedas_huerta(20)
		actualizar_dibujo()

func cosechar() -> bool:
	if fase_actual == FasePlanta.COSECHABLE:
		print("planta cosechada")
		GameManager.sumar_monedas_huerta(30)
		return true
	else:
		return false
