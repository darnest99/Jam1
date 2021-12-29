extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tween = get_node("Tween")
var mult
var soft

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Heart_body_entered(body):
	mult = material.get('shader_param/multiplier')
	tween.interpolate_property(get_material(), "shader_param/multiplier", mult, mult-0.1, 0.1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	soft = material.get('shader_param/softness')
	tween.interpolate_property(get_material(), "shader_param/softness", soft, soft-0.1, 0.1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
