extends Node

func _process(delta):
	if Input.is_action_just_pressed("ui_exit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("ui_fullscreen"):
		OS.set_window_fullscreen(not OS.window_fullscreen)
