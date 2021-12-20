extends Node2D

export (PackedScene) var mob_scene


func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MobTimer_timeout():
	randomize()
	var spawnPoints = $SpawnPositions.get_children()
	var mob = mob_scene.instance()
	for point in spawnPoints:
		var spawnIndex = randi() % spawnPoints.size()
		var spawnPoint = spawnPoints[spawnIndex]
		spawnPoints.remove(spawnIndex)
		var pos = spawnPoint.global_position
		add_child(mob)
		mob.global_position = pos

