extends Area2D

@onready var text_panel = %TextPanel

@export var memory: Array[String] = ["Put memory here"]

func _on_body_entered(body):
	if body.name == "Player":
		for i in memory:
			text_panel.queue_text(i)
		queue_free()
