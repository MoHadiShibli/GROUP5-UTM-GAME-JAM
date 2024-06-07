extends StaticBody2D

@export var chest_ID: int
@onready var interaction_area = $InteractionArea
@onready var animated_sprite = $AnimatedSprite2D
@onready var interaction_collision = $InteractionArea/CollisionShape2D

func _ready():
	interaction_area.interact = Callable(self, "open_chest")

func open_chest():
	if chest_ID in GameManager.keys:
		animated_sprite.frame = 1
		interaction_collision.disabled = true
