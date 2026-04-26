extends CharacterBody2D

const SPEED = 175.0
@onready var pointer: Sprite2D = $Pointer
@onready var game_manager: Node2D = $"../GameManager"

func _ready():
	add_to_group("player")

func _physics_process(_delta):
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	direction = direction.normalized()
	velocity = direction * SPEED
	
	move_and_slide()

func _process(_delta):
	var goal = game_manager.current_goal
	if goal == null:
		return
	
	var player_pos = global_position
	var goal_pos = goal.global_position
	
	# Handles if goal is on a different floor
	if player_pos.y < 0 and goal_pos.y > 0:
		pointer.rotation = PI
	elif player_pos.y > 0 and goal_pos.y < 0:
		pointer.rotation = 0
	else:
		# Point toward goal
		var direction = (goal_pos - player_pos).normalized()
		pointer.rotation = direction.angle() + PI / 2
