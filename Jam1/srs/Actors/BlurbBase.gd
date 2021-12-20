extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
var direction


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = position.direction_to(get_parent().get_child(0).global_position)
	apply_central_impulse(direction * -10)


func _on_Heart_area_entered(area):
	if area.name == 'CombatArea':
		$Particles2D.emitting = false
		yield(get_tree().create_timer(1), "timeout")
		queue_free()
		print('yep')
		print(area.name)
