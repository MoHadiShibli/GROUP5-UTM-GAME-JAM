extends Node

@onready var player = %Player

var keys = []
var hearts = 3
var artifacts = []
var player_speed: int
var player_vision: float

func change_hearts():
	pass

func apply_effects():
	if "Heart" in artifacts:
		hearts = 4
		print("+1")
	elif "SPEED" in artifacts:
		player_speed = 200
	elif "Vision" in artifacts:
		player_vision = 0.8
