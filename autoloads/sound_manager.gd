extends Node

var sound_dic: Dictionary = {
	Sound.BUTTON: preload("res://Audio/Sounds/Menu/Move2.wav"),
	Sound.IMPACT: preload("res://Audio/Sounds/Hit & Impact/Impact2.wav"),
	Sound.SKILL_HIT: preload("res://Audio/Sounds/Hit & Impact/Impact.wav"),
	Sound.PICKUP: preload("res://Audio/Sounds/Bonus/Bonus2.wav")
}

@export var stream_players: Array[AudioStreamPlayer]

func play(type: int) -> void:
	var stream_player = get_free_stream_player()
	if not stream_player:
		return
	var audio = sound_dic[type]
	stream_player.stream = audio
	stream_player.pitch_scale = randf_range(0.8, 1.2)
	stream_player.play()

func get_free_stream_player() -> AudioStreamPlayer:
	for stream in stream_players:
		if not stream.playing:
			return stream
	return null
	
