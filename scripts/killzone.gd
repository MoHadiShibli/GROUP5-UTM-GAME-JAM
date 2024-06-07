extends Area2D

@onready var timer = $Timer
@onready var invincible_timer = $invincible
const PLAYER = preload("res://scenes/player.tscn")
var invincible = false

func _on_body_entered(body):
	if body.name == "Player" and not invincible:
		GameManager.hearts -= 1
		invincible = true
		invincible_timer.start()
		if GameManager.hearts <= 0:
			Engine.time_scale = 0.5
			timer.start()
	
func _on_timer_timeout():
	GameManager.hearts = 3
	GameManager.artifacts = []
	GameManager.keys = []
	GameManager.player_vision = 0.6
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_invincible_timeout():
	invincible = false
