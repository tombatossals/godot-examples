extends ColorRect

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_node("SndPause").play()
		hide() if get_tree().is_paused() else show() 
		get_tree().set_pause(not get_tree().is_paused())


