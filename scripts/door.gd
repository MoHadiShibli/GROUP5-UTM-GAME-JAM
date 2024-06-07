extends StaticBody2D

@export var door_ID: int
@onready var interaction_area = $InteractionArea
@onready var interaction_collision = $InteractionArea/CollisionShape2D
@onready var sprite = $AnimatedSprite2D
@onready var collision = $CollisionShape2D

@onready var animation = $AnimationPlayer

func _ready():
	interaction_area.interact = Callable(self, "open_door")

func open_door():
	if door_ID in GameManager.keys:
		animation.play("open_door")
		interaction_collision.disabled = true
	else:
		animation.play("no_access")
