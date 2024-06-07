extends CharacterBody2D

@onready var nav_agent = $NavigationAgent2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var detection_area = $detection_area
@export var patrol_points: Array[Vector2] = [Vector2(0, 0), Vector2(100, 0)]
@export var patrol_speed: float = 30
@export var chase_speed: float = 100

var current_patrol_index: int = 0
var player_detected: bool = false
var player = null

func _ready():
	pass

func _physics_process(delta):
	if player_detected:
		chase_player(delta)
	else:
		patrol(delta)
		
	update_animation()

func patrol(delta):
	var target_position = patrol_points[current_patrol_index]
	if position.distance_to(target_position) < 10:
		current_patrol_index = (current_patrol_index + 1) % patrol_points.size()
		target_position = patrol_points[current_patrol_index]
	
	velocity = (target_position - position).normalized() * patrol_speed
	move_and_slide()

func chase_player(delta):
	if player:
		velocity = (player.position - position).normalized() * chase_speed
		move_and_slide()

func _on_detection_area_body_entered(body):
	if body.name == "Player":
		player = body
		player_detected = true

func _on_detection_area_body_exited(body):
	if body.name == "Player":
		player = body
		player_detected = false

func update_animation():
	if velocity == Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				animated_sprite.flip_h = true
				animated_sprite.play("walking")
			else:
				animated_sprite.flip_h = false
				animated_sprite.play("walking")
		else:
			if velocity.y > 0:
				animated_sprite.play("walking_down")
			else:
				animated_sprite.play("walking_up")

# Optional: Debugging function to print positions and distances
func _debug():
	print("Enemy Position: ", position)
	if player:
		print("Player Position: ", player.position)
		print("Distance to Player: ", position.distance_to(player.position))
