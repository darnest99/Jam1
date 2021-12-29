extends Control


onready var spin_box : SpinBox = $MarginContainer/GridContainer/SpinBox
onready var game_saver : Node = $GameSaver


func _on_NewGameButton_pressed():
	get_tree().change_scene("res://srs/World/WorldBase.tscn")
	get_tree().paused = false


#player base is not within the tree
func _on_LoadGame_pressed():
	game_saver.load(spin_box.value)
