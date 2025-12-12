extends Area2D
var COLHEITA_PRONTA = false
var COLHER = false
var  ESTAGIO = 0


#var PLANTAVEL = false
#var SUFICIENTE = false


func _ready() -> void:
	
	await get_tree().create_timer(2).timeout
	print("STAGE1")
	await get_tree().create_timer(2).timeout
	print("STAGE2")
	await get_tree().create_timer(2).timeout
	print("STAGE3")
	await get_tree().create_timer(2).timeout
	ESTAGIO = 4
	if ESTAGIO == 4:
		COLHEITA_PRONTA = true
		
func _physics_process(delta: float) -> void:
	
	if COLHER == true and COLHEITA_PRONTA == true and Input.is_action_just_released("interagir"):
		GlobalDados.TOMATE += 1
		queue_free()
		
			
		
func _on_body_entered(body: Node2D) -> void:
	COLHER = true
		
func _on_body_exited(body: Node2D) -> void:
	COLHER = false
