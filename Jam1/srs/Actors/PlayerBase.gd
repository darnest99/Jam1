extends Node2D


var game_over = false


#Check if game is over and go to menu
func _process(delta):
	game_over = $KinematicBody2D.game_over
	if game_over == true:
		yield(get_tree().create_timer(0.1), "timeout")
		get_tree().change_scene("res://srs/World/Menu.tscn")
