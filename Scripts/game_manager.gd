extends Node2D

var goal_list: Array = []
var current_goal: Node2D
var previous_goal: Node2D
var points: int = 0
@onready var goal_label: Label = $"../CanvasLayer/GoalLabel"
@onready var points_label: Label = $"../CanvasLayer/PointsLabel"

func _ready() -> void:
	goal_list = get_children()
	current_goal = goal_list.pick_random()
	_set_goal_text(current_goal.name)
	_set_points_text(str(points))
	
	for goal in goal_list:
		goal.body_entered.connect(_on_goal_reach.bind(goal))

func _process(_delta: float) -> void:
	pass

func _on_goal_reach(body, area) -> void:
	if body == %Player and area == current_goal:
		points += 1
		var next_goal = goal_list.pick_random()
		while next_goal == current_goal:
			next_goal = goal_list.pick_random()
		current_goal = next_goal
		_set_goal_text(current_goal.name)
		_set_points_text(str(points))

func _set_goal_text(text) -> void:
	goal_label.text = "Goal: " + text
func _set_points_text(text) -> void:
	points_label.text = "Points: " + text
