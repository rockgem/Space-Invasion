extends Node2D


@export_enum('TARGET', 'LINEAR') var move_type

@export var hp = 1
@export var speed = 50.0
var towards



func _physics_process(delta):
	if global_position.y > 200:
		queue_free()
		return
	
	if move_type == 0:
		look_at(ManagerGame.global_player_ref.global_position)
		
		if towards == Vector2.ZERO:
			return
		
		if global_position.distance_to(towards) < 0.5:
			towards = Vector2.ZERO
		
		var dif = global_position.direction_to(towards)
		
		global_position += dif * speed * delta
	else:
		global_position += towards * speed * delta



func shoot():
	var i = load("res://actors/objs/EnemyBullet.tscn").instantiate()
	i.dir = global_position.direction_to(ManagerGame.global_player_ref.global_position)
	ManagerGame.global_world_ref.spawn_obj(i, global_position)


func _on_timer_timeout():
	shoot()


func _on_enemy_hurtbox_area_entered(area):
	area.get_parent().queue_free()
	
	hp -= 1
	
	var ex = load("res://actors/objs/Explosion.tscn").instantiate()
	ManagerGame.global_world_ref.spawn_obj(ex, global_position)
	
	if hp <= 0:
		queue_free()
