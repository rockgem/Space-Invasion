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
