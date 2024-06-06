extends AnimatedSprite2D

@onready var killzone_collision = $Killzone/CollisionShape2D
@onready var sfx_spikes = $sfx_spikes

func _ready():
	set_process(true)

func _process(delta):
	var current_frame = frame
	match current_frame:
		1, 2, 3, 4, 5:
			killzone_collision.disabled = false
		_:
			killzone_collision.disabled = true
			sfx_spikes.play()
			
		
