extends Area2D
var PLANTAVEL = false
var SUFICIENTE = false
@export var PLANTAR:PackedScene = load("res://CENAS/SEMENTE _DE_TOMATE.tscn")
var PLANTADO = false

func _ready() -> void:
	pass

	
func _physics_process(delta: float) -> void:
	if PLANTADO == true:
		queue_free()
	
	if GlobalDados.SEMENTE >= 1:
		SUFICIENTE = true
	else:
		SUFICIENTE = false
	
	if PLANTAVEL == true and SUFICIENTE == true and Input.is_action_just_released("interagir"):
		PLANTADO = true
		GlobalDados.SEMENTE -= 1
		var instance = PLANTAR.instantiate()
		instance.global_position = global_position
		get_parent().add_child(instance)
		
		
		
		
func _on_body_entered(body: Node2D) -> void:
	PLANTAVEL = true
		
func _on_body_exited(body: Node2D) -> void:
	PLANTAVEL = false
