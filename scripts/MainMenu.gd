extends Control

@onready var animation_player = $AnimationPlayer

func _ready():
	pass

func _on_button_pressed():
	animation_player.play("fade_in")

func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://levels/level1.tscn")
