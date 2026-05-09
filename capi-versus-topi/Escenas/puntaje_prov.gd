extends CanvasLayer


@onready var label_monedas: Label = $monedas
@onready var label_topos: Label = $oleadaTopos

func _ready() -> void:
	label_monedas.text = str(GameManager.monedas)
	label_topos.text = str(GameManager.topos_derrotados) + "/10"
	GameManager.actualizar_monedas.connect(actualizar_texto_monedas)
	GameManager.actualizar_topos.connect(actualizar_texto_topos)
	
func actualizar_texto_monedas(nueva_cantidad: int) ->void:
	label_monedas.text = str(nueva_cantidad)

func actualizar_texto_topos(topos_muertos: int) ->void:
	label_topos.text = str(GameManager.topos_derrotados) + "/10"
