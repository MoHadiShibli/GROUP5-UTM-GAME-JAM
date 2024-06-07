extends MarginContainer

@onready var label = $MarginContainer/Label

@onready var timer = $LetterDisplayTimer

@onready var next_line_indicator = $NinePatchRect/Control2/NextLineIndicator


const MAX_WIDTH = 256
var text = ""
var letter_index = 0
var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.2
var is_last_line = false

signal finished_displaying()

func display_text(text_to_display: String, last_line: bool):
	text = text_to_display
	label.text = text_to_display
	is_last_line = last_line
	
	await resized
	custom_minimum_size.x = min(size.x, MAX_WIDTH)
	
	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized # wait for x resize
		await resized # wait for y resize
		custom_minimum_size.y = size.y

	global_position.x -= (size.x / 2)*scale.x
	global_position.y -= (size.y + 64)*scale.y
	
	label.text = ""
	next_line_indicator.visible = false
	_display_letter()
	
func _display_letter():
	label.text += text[letter_index]
		
	letter_index += 1
	if letter_index >= text.length():
		finished_displaying.emit()
		next_line_indicator.visible = not is_last_line
		return
	match text[letter_index]:
		"!",".",",","?":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)

func _on_letter_display_timer_timeout():
	_display_letter()
