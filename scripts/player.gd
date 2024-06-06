extends CharacterBody2D
@export var SPEED = 200
@onready var animated_sprite = $AnimatedSprite2D
@onready var sfx_walk = $sfx_walk

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED

	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
		sfx_walk.play()
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
		
	move_and_slide()
