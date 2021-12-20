extends Node2D


var game_over = false


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	game_over = $KinematicBody2D.game_over
	if game_over == true:
		get_tree().change_scene("res://srs/World/Menu.tscn")
