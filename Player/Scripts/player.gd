extends CharacterBody2D

const SPEED = 175.0

func _physics_process(_delta):
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	
	direction = direction.normalized()
	velocity = direction * SPEED
	
	move_and_slide()
