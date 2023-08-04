extends Weapon



func _ready():
	fire_rate = 0.1


func shoot():
	Sfx.get_node("Laser").play()
	for pos in get_children():
		var i = bullet.instantiate()
		i.dir = Vector2.UP
		ManagerGame.global_world_ref.spawn_obj(i, pos.global_position)
