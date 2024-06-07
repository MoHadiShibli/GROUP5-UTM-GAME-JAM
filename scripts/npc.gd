extends AnimatableBody2D

@onready var interaction_area: InteractionArea = $Interaction_area
@onready var animated_sprite = $AnimatedSprite2D

@export var lines: Array[String] = [
	"Wassup!",
	"How are you doing there buddy!",
	"Are you lost by any chance?",
	"Be careful out there...",
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogManager.start_dialog(global_position, lines)
	await DialogManager.dialog_finished
