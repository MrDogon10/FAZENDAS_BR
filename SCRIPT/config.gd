extends Node
@onready var MOBILE:= $MOBILE
var MOBILI = true

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if MOBILI == true:
		if Input.is_action_pressed("MOBILE"):
			MOBILE.hide()
			await get_tree().create_timer(0.5).timeout
			MOBILI = false
			
	else:
		if Input.is_action_pressed("MOBILE"):
			MOBILE.show()
			await get_tree().create_timer(0.5).timeout
			MOBILI = true
		
