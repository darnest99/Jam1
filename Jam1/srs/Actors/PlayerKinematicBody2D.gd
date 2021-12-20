extends KinematicBody2D

export var speed = 200
export var dash_multiplier = 50
var velocity = Vector2()
var collision = null
var attacking = false
var blurbs = []
var game_over = false

func _ready():
	blurbs = $Blurbs.get_children()

func get_input():
	# Add these actions in Project Settings -> Input Map.
	velocity = Vector2()
	if Input.is_action_pressed('forward'):
		velocity = Vector2(speed, 0).rotated(rotation)
		$Particles2D.emitting = true
		$AnimatedSprite.animation = 'walk'
	else:
		yield(get_tree().create_timer(0.3), "timeout")
		$AnimatedSprite.animation = 'idle'
		$Particles2D.emitting = false
	#Dash mechanic
	#Should create a variable for dash length that effects the burst time and particles
	#Rn it kinda looks like teleportation might change
	#The change in velocity only lasts for one frame
	if Input.is_action_just_pressed("dash_click"):
		$CombatArea/CombatCollision.disabled = false
		$Heart/HeartCollision.disabled = true
		attacking = true
		#$AnimatedSprite.animation = 'dash'
		$Particles2D.speed_scale = 10
		$Particles2D.amount = 30
		$Particles2D.lifetime = 2
		velocity = Vector2(speed*dash_multiplier, 0).rotated(rotation)
		$AnimatedSprite.play("dash")
		yield($AnimatedSprite, "animation_finished")
		$Particles2D.speed_scale = 1
		$Particles2D.amount = 12
		velocity = Vector2(speed, 0).rotated(rotation)
		$CombatArea/CombatCollision.disabled = true
		yield(get_tree().create_timer(0.1), "timeout")
		$Heart/HeartCollision.disabled = false
		attacking = false

		#If you want to add a cooldown
		#yield(get_tree().create_timer(0.2), "timeout")


func _physics_process(delta):
	get_input()
	var dir = get_global_mouse_position() - global_position
	# Don't move if too close to the mouse pointer.
	if dir.length() > 5:
		rotation = dir.angle()
		velocity = move_and_slide(velocity)
		#for i in get_slide_count():
			#var collision = get_slide_collision(i)
			#print(collision.collider.name)
			#if attacking == false:
				#$Blurbs/BlurbAttached1.emitting = true
		#Then make the shaders begin emmiting

var blurb_index = 0

func _on_Heart_body_entered(body):
	print('glug')
	blurbs[blurb_index].emitting = true
	blurb_index += 1
	if blurb_index == blurbs.size():
		print(blurb_index)
		print('game over')
		game_over = true
		return game_over
