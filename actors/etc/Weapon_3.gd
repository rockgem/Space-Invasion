extends Weapon


func shoot():
	for pos in get_children():
		var i = bullet.instantiate()
		i.dir = Vector2.UP
		ManagerGame.global_world_ref.spawn_obj(i, pos.global_position)
