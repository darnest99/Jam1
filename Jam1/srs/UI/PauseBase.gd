extends Control


onready var spin_box : SpinBox = $MarginContainer/GridContainer/SpinBox
onready var game_saver : Node = $GameSaver


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event.is_action_pressed('pause'):
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_quitButton_pressed():
	get_tree().change_scene("res://srs/UI/Menu.tscn")


func _on_saveButton_pressed():
	game_saver.save(spin_box.value)


func _on_loadButton_pressed():
	game_saver.load(spin_box.value)
