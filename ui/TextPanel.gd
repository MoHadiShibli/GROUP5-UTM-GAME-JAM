extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var text_panel_container: Control = $TextPanelContainer
@onready var start: Label = $TextPanelContainer/MarginContainer/HBoxContainer/Start
@onready var label: Label = $TextPanelContainer/MarginContainer/HBoxContainer/Label
@onready var end: Label = $TextPanelContainer/MarginContainer/HBoxContainer/End


enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
@export var text_queue: Array[String] = []

func _ready():
	# Initialize the tween node
	hide_textpanel()
	queue_text(text_queue)

func _process(delta):
	match current_state:
		State.READY:
			if !text_queue.is_empty():
				display_text()
		State.READING:
			if Input.is_action_just_pressed("advance_dialog"):
				animation_player.stop()
				label.visible_ratio = 1.0
				end.text = ">"
				change_state(State.FINISHED)
			pass
		State.FINISHED:
			if Input.is_action_just_pressed("advance_dialog"):
				change_state(State.READY)
				hide_textpanel()

func queue_text(next_text):
	text_queue.push_back(next_text)

func hide_textpanel():
	start.text = ""
	end.text = ""
	label.text = ""
	label.visible_ratio = 0
	text_panel_container.hide()

func show_textpanel():
	start.text = "*"
	text_panel_container.show()

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	change_state(State.READING)
	show_textpanel()
	var animation_speed = len(next_text)*0.05
	if animation_speed < 1.0:
		animation_player.speed_scale = 2
		animation_player.play("letters_animation")
	else:
		animation_player.speed_scale = animation_speed
		
	animation_player.play("letters_animation")

func _on_animation_player_animation_finished(anim_name):
	change_state(State.FINISHED)
	end.text = ">"

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			pass
		State.READING:
			pass
		State.FINISHED:
			pass
