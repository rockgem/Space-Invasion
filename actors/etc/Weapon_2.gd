extends Weapon


# fire rate is already in the parent class Weapon
# i made it this way because each different weapon will have a shared resources anyways
# so we may only need to modify the specific weapon's fire rate, and behaviours etc.
func _ready():
	fire_rate = .15


func shoot():
	for pos in get_children():
		var i = bullet.instantiate()
		i.dir = Vector2.UP
		ManagerGame.global_world_ref.spawn_obj(i, pos.global_position)
