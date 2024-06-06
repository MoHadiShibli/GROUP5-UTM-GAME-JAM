extends Node

var audioPlayers : Array     # list of music tracks
var current_player : int = 0 # keep track for player in use

func _ready():
	if _find_audio_players():
		if _connect_audio_players_to_finished():
			play_audio(current_player)

func _find_audio_players() -> bool:
	var found_at_least_one := 0
	for c in get_children():
		if c is AudioStreamPlayer:
			audioPlayers.push_back(c)
			found_at_least_one += 1
	return found_at_least_one > 0

func _connect_audio_players_to_finished() -> bool:
	var all_good := true
	for ap in audioPlayers:
		if ap is AudioStreamPlayer:
			all_good = ap.finished.connect(_song_finished) == OK
		if not all_good:
			return false
	return all_good

# player next one is finished
func _song_finished():
	current_player += 1
	if current_player >= audioPlayers.size():
		current_player = 0
	play_audio(current_player)


func play_audio(player : int):
	var c = audioPlayers[player]
	if c is AudioStreamPlayer:
		c.play()
