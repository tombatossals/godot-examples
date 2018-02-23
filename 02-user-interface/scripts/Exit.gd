extends ColorRect

func _process(delta):
	if not get_tree().is_paused() and Input.is_action_just_pressed("exit_menu"):
		get_tree().set_pause(true)
		get_node("SndExit").play()
		show()
	
	if get_tree().is_paused():
		if Input.is_action_just_pressed("exit_accept"):
			get_tree().quit()
		elif Input.is_action_just_pressed("exit_cancel"):
			hide()
			get_tree().set_pause(false)
			
