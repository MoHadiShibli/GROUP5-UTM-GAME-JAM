extends StaticBody2D

@export var door_ID: int
@onready var interaction_area = $InteractionArea
@onready var interaction_collision = $InteractionArea/CollisionShape2D
@onready var sprite = $AnimatedSprite2D
@onready var collision = $CollisionShape2D

func _ready():
	interaction_area.interact = Callable(self, "open_door")

func open_door():
	if door_ID in GameManager.keys:
		interaction_collision.disabled = true
		await get_tree().create_timer(0.2).timeout
		sprite.position.y = 3
		sprite.frame = 1
		await get_tree().create_timer(0.2).timeout
		sprite.frame = 2
		await get_tree().create_timer(0.2).timeout
		sprite.position.x = 1
		sprite.frame = 3
		collision.disabled = true



