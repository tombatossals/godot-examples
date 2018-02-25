extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.set_window_fullscreen(not OS.window_fullscreen)
