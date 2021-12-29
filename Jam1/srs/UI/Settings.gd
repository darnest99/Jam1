extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#switch to the opposite screen size as current when pressed
func _on_FullscreenButton_pressed():
	OS.set_window_fullscreen(!OS.window_fullscreen)


#go back to menu
func _on_BackButton_pressed():
	get_tree().change_scene("res://srs/UI/Menu.tscn")
