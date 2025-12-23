extends CanvasLayer
#DADOS
@onready var label_tomate: Label = $inf_tomate 
@onready var label_semente: Label = $inf_semente
@onready var label_maca: Label =$inf_maca 
@onready var LABEL_MONEY: Label =$MONEY

#SISTEMA DIA E NOITE
var TIMES_DAY = "DIA"
@onready var DAY_NIGHT: ColorRect = $DAY_NIGHT

func _ready():
	while true:
		await change_time("NIGHT")
		await change_time("DIA")

func change_time(value):
	await get_tree().create_timer(60).timeout
	TIMES_DAY = value
	print(TIMES_DAY)



func _process(delta: float) -> void:
	#DADOS-LABEL
	label_tomate.text = "Tomate: " + str(GlobalDados.TOMATE)
	label_semente.text = "semente: " + str(GlobalDados.SEMENTE)
	label_maca.text = "maca: " + str(GlobalDados.MACA)
	LABEL_MONEY.text = "MONEY: " + str(GlobalDados.MONEY)

#SISTEMA DIA E NOITE
	if TIMES_DAY == "DIA":
		DAY_NIGHT.hide()
	else: 
		DAY_NIGHT.show()
		
