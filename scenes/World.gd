extends Node2D


@onready var sort = $Sort


func _ready():
	# reference this world globally so we can access the functions anywhere
	# functions such as spawn_obj() which is used for spawning bullets from player scene
	ManagerGame.global_world_ref = self


# g_pos - global_position
# instance - the object instantiated via instantiate() function
func spawn_obj(instance, g_pos):
	instance.global_position = g_pos
	sort.add_child(instance)


func get_random_pos():
	var r_pos = Vector2.ZERO
	
	r_pos.x = randf_range($TL.global_position.x, $BR.global_position.x)
	r_pos.y = randf_range($TL.global_position.y, $BR.global_position.y)
	
	return r_pos


func get_random_spawn_point():
	var r_pos = Vector2.ZERO
	
	r_pos.x = randf_range($SpawnPoint.global_position.x, $SpawnPoint.global_position.x)
	r_pos.y = randf_range($SpawnPoint2.global_position.y, $SpawnPoint2.global_position.y)
	
	return r_pos


func _on_enemy_spawner_timeout():
	var i = load("res://actors/entities/Enemy.tscn").instantiate()
	i.towards = get_random_pos()
	spawn_obj(i, get_random_spawn_point())
