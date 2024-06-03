extends StaticBody2D

@onready var collision_area = $Area2D
var SPEED = 50
var player_in_area = false
var player_position = Vector2.ZERO

func _physics_process(delta):
	if player_in_area:
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		var relative_position = player_position - global_position
		
		var allowed_direction = Vector2.ZERO
		if abs(relative_position.x) > abs(relative_position.y):
			allowed_direction.x = sign(relative_position.x) * -1
		else:
			allowed_direction.y = sign(relative_position.y) * -1
		if direction.dot(allowed_direction) > 0:
			move_and_collide(allowed_direction * SPEED * delta)

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player_in_area = true
		player_position = body.global_position

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		player_in_area = false
