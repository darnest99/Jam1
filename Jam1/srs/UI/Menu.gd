extends Control


#make cursor visible
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


#start game
func _on_StartButton_pressed():
	get_tree().change_scene("res://srs/UI/LoadBase.tscn")


#go to settings
func _on_SettingsButton_pressed():
	get_tree().change_scene("res://srs/UI/Settings.tscn")


#quit
func _on_QuitButton_pressed():
	get_tree().quit()
