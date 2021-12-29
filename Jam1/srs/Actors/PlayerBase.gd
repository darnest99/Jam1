extends Node2D


var game_over = false
var blurb_index = 0
var loadPos
onready var SAVE_KEY: String = "player"

signal loaded


#Check if game is over and go to menu
func _process(delta):
	blurb_index = $KinematicBody2D.blurb_index
	game_over = $KinematicBody2D.game_over
	if game_over == true:
		get_tree().paused = true
		yield(get_tree().create_timer(0.1), "timeout")
		get_tree().change_scene("res://srs/UI/Menu.tscn")


func save(save_game: Resource):
	save_game.data[SAVE_KEY] = {
		'blurb_index': blurb_index,
		'position': $KinematicBody2D.global_position,
	}


func load(save_game: Resource):
	var data: Dictionary = save_game.data[SAVE_KEY]
	blurb_index = data['blurb_index']
	loadPos = data['position']
	print('loading')
	emit_signal("loaded")
#	get_node("KinematicBody2D").blurb_index = blurb_index
#	get_child(0).global_position.set(loadPos)
