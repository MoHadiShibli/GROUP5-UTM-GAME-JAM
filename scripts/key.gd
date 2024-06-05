extends StaticBody2D

signal chest_opened

var keytaken = false
var in_chest_zone = false

func _on_Area2D_body_entered(body: PhysicsBody2D):
	if keytaken == false:
		keytaken = true
		$Sprite.queue_free()
func _process(delta):
	if keytaken == true:
		if in_chest_zone == true:
			if Input.is_action_just_pressed("ui_accept"):
				print("chest_opened")
				emit_signal("chest_opened")


func _on_chest_zone_body_entered(body: PhysicsBody2D):
	in_chest_zone = true
	print(in_chest_zone)
func _on_chest_zone_body_exited(body):
	in_chest_zone = false
	print(in_chest_zone)
