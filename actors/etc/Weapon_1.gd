extends Weapon


func shoot():
	Sfx.get_node("Laser").play()
	var i = bullet.instantiate()
	i.dir = Vector2.UP
	ManagerGame.global_world_ref.spawn_obj(i, global_position)
