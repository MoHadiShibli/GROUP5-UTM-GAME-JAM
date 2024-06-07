extends CharacterBody2D

@export var SPEED: int
@export var hearts: int = 3
@onready var animated_sprite = $AnimatedSprite2D
@onready var light = $Light

func _process(delta):
	if GameManager.player_vision == 0.8:
		light.texture_scale = 0.8
	else:
		light.texture_scale = 0.6

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if "SPEED" in GameManager.artifacts:
		SPEED = 200
	velocity = direction * SPEED
	

	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
	elif direction.x > 0:
		animated_sprite.flip_h = true
		animated_sprite.play("walking")  # Ensure you have this animation
	elif direction.x < 0:
		animated_sprite.flip_h = false
		animated_sprite.play("walking")  # Ensure you have this animation
	elif direction.y > 0:
		animated_sprite.play("walking_down")
	elif direction.y < 0:
		animated_sprite.play("walking_up")
	move_and_slide()

func die():
	animated_sprite.play("death")
