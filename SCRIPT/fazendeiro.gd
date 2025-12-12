extends CharacterBody2D

var speed:int = 100 

@onready var animate:= $AnimatedSprite2D


#MOVE PLAYER
func _physics_process(delta: float) -> void:
	var direction =Input.get_vector("left","right","up","down")
	if Input.is_action_pressed("right") || Input.is_action_pressed("left"):
		direction.y =0
		
	elif Input.is_action_pressed("up") || Input.is_action_pressed("down"):
		direction.x =0
		
		#PLAYER PARADO
	else:
		direction = Vector2.ZERO
		velocity.x = move_toward(velocity.x, 0, speed)
		animate.play("idle")
	
	
	direction = direction.normalized()
	velocity = (direction * speed)
	
	
	#ANIMATE
	if Input.is_action_pressed("up"):
		animate.play("up")
	
	elif Input.is_action_pressed("down"):
		animate.play("down")
	
	elif Input.is_action_pressed("left"):
		animate.play("run")
		animate.flip_h = true
	
	elif Input.is_action_pressed("right"):
		animate.play("run")
		animate.flip_h = false
		
		
	move_and_slide()
	
