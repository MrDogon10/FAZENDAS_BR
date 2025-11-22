extends CharacterBody2D

var speed:int = 200 


func _physics_process(delta: float) -> void:
	var direction =Input.get_vector("left","right","up","down")
	if Input.is_action_pressed("right") || Input.is_action_pressed("left"):
		direction.y =0
	elif Input.is_action_pressed("up") || Input.is_action_pressed("down"):
		direction.x =0
	else:
		direction = Vector2.ZERO
	
	direction = direction.normalized()
	velocity = (direction * speed)
	move_and_slide()
