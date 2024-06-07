extends CanvasLayer

@onready var hearts_full = $HeartsFull

func _process(delta):
	load_hearts()
	
func load_hearts():
	hearts_full.size.x = GameManager.hearts * 66
	
