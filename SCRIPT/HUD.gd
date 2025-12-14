extends CanvasLayer

@onready var label_tomate: Label = $inf_tomate 
@onready var label_semente: Label = $inf_semente
@onready var label_maca: Label =$inf_maca 
@onready var LABEL_MONEY: Label =$MONEY

func _ready():
	pass

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label_tomate.text = "Tomate: " + str(GlobalDados.TOMATE)
	label_semente.text = "semente: " + str(GlobalDados.SEMENTE)
	label_maca.text = "maca: " + str(GlobalDados.MACA)
	LABEL_MONEY.text = "MONEY: " + str(GlobalDados.MONEY)
