extends CharacterBody2D

const SPEED = 175.0

func _ready():
	add_to_group("player")

func _physics_process(_delta):
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	direction = direction.normalized()
	velocity = direction * SPEED
	
	move_and_slide()
