extends Node

@onready var player = %Player

var keys = []
var hearts = 3
var artifacts = []
var mem_crystals = []

func _ready():
	pass 

func change_hearts():
	pass

func apply_effect(artifact):
	if artifact == "Heart":
		hearts += 1
	elif artifact == "Speed":
		player.SPEED = 200
	elif artifact == "Vision":
		$Player/Light.texture_scale = 0.8




