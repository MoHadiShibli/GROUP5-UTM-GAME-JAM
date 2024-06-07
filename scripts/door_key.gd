extends Area2D

@export var key_ID: int

func _on_body_entered(body):
	if body.name == "Player":
		GameManager.keys.append(key_ID)
		queue_free()
