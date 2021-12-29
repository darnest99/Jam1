extends Node2D

export (PackedScene) var mob_scene
export var spawn_distance = 1000


func _ready():
	#Hide cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MobTimer_timeout():
	#random seed
	randomize()
	#Get all spawn positions
	var spawnPoints = $SpawnPositions.get_children()
	#instance the mob
	var mob = mob_scene.instance()
	for point in spawnPoints:
		#check if the point is near to player
		if distanceTo($PlayerBase.get_child(0), point) < spawn_distance:
			#I don't understand what I did here
			var spawnIndex = randi() % spawnPoints.size()
			var spawnPoint = spawnPoints[spawnIndex]
			spawnPoints.remove(spawnIndex)
			#get position of spawn point
			var pos = spawnPoint.global_position
			#add instanced mob at position of spawn point
			add_child(mob)
			mob.global_position = pos

#find distance between 2 nodes
func distanceTo(targetNode, thisNode):
	var a=Vector2(targetNode.position - thisNode.position)
	return sqrt((a.x * a.x) + (a.y * a.y))
