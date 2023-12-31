extends Area2D


signal hp_zero


@export var hp = 50


func _on_area_entered(area):
	area.get_parent().queue_free()
	
	hp -= 1
	
	var ex = load("res://actors/objs/Explosion.tscn").instantiate()
	ManagerGame.global_world_ref.spawn_obj(ex, global_position)
	
	if hp <= 0:
		var df = load("res://actors/objs/DamageFloater.tscn").instantiate()
		df.get_node('Label').text = '5'
		ManagerGame.global_world_ref.spawn_obj(df, global_position)
		
		ManagerGame.global_world_ref.score += 5
		ManagerGame.enemy_killed.emit(global_position)
		
		hp_zero.emit()
