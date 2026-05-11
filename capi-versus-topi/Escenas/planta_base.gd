extends Node2D
class_name PlantaBase

#Para el gestor de hp:
var vida: int = 30

#Fases de las plantas:
enum FasePlanta { BROTE, CRECIENDO, COSECHABLE }

var fase_actual: FasePlanta = FasePlanta.BROTE

#IMAGENES SPRITE:
@onready var sprite_brote: Sprite2D = $SpriteBrote
@onready var sprite_creciendo: Sprite2D = $SpriteCreciendo
@onready var sprite_cosechable: Sprite2D = $SpriteCosechable


func _ready() -> void:
	actualizar_dibujo()
	
func actualizar_dibujo() -> void:
	#INICIAN LOS SPRITES OCULTOS
	sprite_brote.hide()
	sprite_creciendo.hide()
	sprite_cosechable.hide()
	
	match fase_actual:
		#SEGÚN LA FASE DE LA PLANTA SE MUESTRA EL SPRITE CORRECTO:
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

func morir() -> void:
	print("el topo mató la planta")
	queue_free()
