extends RigidBody2D


#target is player
var follow_target
export var speed = 0.005
var velocity

# find target
func _ready():
	#set target as player
	follow_target = get_parent().get_parent().get_child(0).get_child(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	direction = follow_target.global_position - global_position
#	_velocity = position * SPEED * delta
#	set_linear_velocity(direction * SPEED * delta)

#create impulse toward target
func _integrate_forces(state):
	var direction = get_direction()
	velocity = direction * speed
	#delay on impulses
	yield(get_tree().create_timer(0.1), "timeout")
	apply_central_impulse(velocity)


#get targets position and find direction to target
func get_direction() -> Vector2:
	return Vector2(
		follow_target.global_position.x - global_position.x, follow_target.global_position.y - global_position.y
	)


#kill blurb when hit
func _on_Heart_area_entered(area):
	if area.name == 'CombatArea':
		$Particles2D.emitting = false
		yield(get_tree().create_timer(1), "timeout")
		queue_free()
