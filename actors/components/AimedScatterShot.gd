extends Node



@export var fire_rate = 2.0


func _ready():
	$Timer.start(fire_rate)


func shoot():
	var count = 8
	var radius = Vector2(1, 0)
	var step = PI / count
	
	var angle = get_parent().global_position.angle_to(ManagerGame.global_player_ref.global_position)
	
	var bullet = load("res://actors/objs/EnemyBullet.tscn")
	
	for i in range(count):
		var b = bullet.instantiate()
		b.dir = radius.rotated(step * i * angle)
		
		ManagerGame.global_world_ref.spawn_obj(b, get_parent().global_position)


func _on_timer_timeout():
	shoot()
