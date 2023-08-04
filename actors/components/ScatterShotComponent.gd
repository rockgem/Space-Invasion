extends Node


@export var fire_rate = 1.0


func _ready():
	$Timer.start(fire_rate)


func shoot():
	var count = 16
	var radius = Vector2(1, 0)
	var step = PI / count
	
	var bullet = load("res://actors/objs/EnemyBullet.tscn")
	
	for i in range(count):
		var b = bullet.instantiate()
		b.dir = radius.rotated(step * i)
		
		ManagerGame.global_world_ref.spawn_obj(b, get_parent().global_position)


func _on_timer_timeout():
	shoot()
