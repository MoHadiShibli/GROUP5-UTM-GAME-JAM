extends Area2D
@onready var sfx_collectable = $sfx_collectable

func _on_body_entered(body):
	if body.name == "Player":
		queue_free()
		sfx_collectable.play()
