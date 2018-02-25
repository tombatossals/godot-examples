extends Node2D

func _process(delta):
	var fps_label = get_node("FPSLabel")
	fps_label.text = "FPS: " + str(Engine.get_frames_per_second())
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("fullscreen"):
		OS.set_window_fullscreen(not OS.window_fullscreen)

func _on_change_resolution_pressed(resolution):
	
	for button in get_node("Header").get_children():
		print("x" + button.text)
		print(str(resolution.x) + "x" + str(resolution.y))
		if button.text != str(resolution.x) + "x" + str(resolution.y):
			button.pressed = false
	print(resolution)
	print(OS.window_size)
	
	OS.window_size = resolution
