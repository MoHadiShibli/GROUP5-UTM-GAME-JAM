extends CharacterBody2D
@export var SPEED = 200
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
	elif direction.x > 0:
		animated_sprite.flip_h = false
		animated_sprite.play("walking")  # Ensure you have this animation
	elif direction.x < 0:
		animated_sprite.flip_h = true
		animated_sprite.play("walking")  # Ensure you have this animation
	elif direction.y > 0:
		animated_sprite.play("walking_down")
	elif direction.y < 0:
		animated_sprite.play("walking_up")





