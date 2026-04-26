extends StaticBody2D

@onready var interactable = $Interactable
@onready var sprite_2d = $Sprite2D
@onready var destination = $Target

func _ready():
	interactable.interact = _on_interact

func _on_interact():
	%Player.global_position = destination.global_position

func _on_interactable_area_entered(_area):
	sprite_2d.frame = 1

func _on_interactable_area_exited(_area):
	sprite_2d.frame = 0
