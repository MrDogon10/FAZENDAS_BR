extends Area2D
var COLETAR = false

func _ready() -> void:
	pass

	
func _process(delta: float) -> void:
	if COLETAR == true and Input.is_action_just_released("interagir"):
		GlobalDados.MACA += 1
		queue_free()
		
		
func _on_body_entered(body: Node2D) -> void:
	COLETAR = true
		
func _on_body_exited(body: Node2D) -> void:
	COLETAR = false
