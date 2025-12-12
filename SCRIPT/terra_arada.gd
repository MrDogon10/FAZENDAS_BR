extends Area2D
var PLANTAVEL = false
var SUFICIENTE = false
@onready var PLANTAR = $"../SEMENTE _DE_TOMATE"


func _ready() -> void:
	pass

	
func _physics_process(delta: float) -> void:
	if GlobalDados.SEMENTE >= 1:
		SUFICIENTE = true
		if PLANTAVEL == true and SUFICIENTE == true and Input.is_action_just_released("interagir"):
			GlobalDados.SEMENTE -= 1
			PLANTAR.instantiate()
			#queue_free()
			
		
func _on_body_entered(body: Node2D) -> void:
	PLANTAVEL = true
		
func _on_body_exited(body: Node2D) -> void:
	PLANTAVEL = false
