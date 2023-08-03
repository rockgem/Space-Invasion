extends Node2D


@onready var sort = $Sort

var groups = [
	load("res://actors/entities/Group.tscn"),
	load("res://actors/entities/Group_2.tscn"),
]

var wave = 1
var wave_max = 10

var score = 0

func _ready():
	# reference this world globally so we can access the functions anywhere
	# functions such as spawn_obj() which is used for spawning bullets from player scene
	ManagerGame.global_world_ref = self
	
	ManagerGame.enemy_killed.connect(on_enemy_killed)
	
	$CanvasLayer/UI.set_hud()
	$CanvasLayer/UI.refresh_hud()


func _physics_process(delta):
	$ParallaxBackground.scroll_offset.y += delta * 80


func cam_shake():
	$AnimationPlayer.play("shake")


# g_pos - global_position
# instance - the object instantiated via instantiate() function
func spawn_obj(instance, g_pos):
	instance.global_position = g_pos
	sort.call_deferred('add_child', instance)


func spawn_boss(instance, g_pos):
	instance.global_position = g_pos
	sort.call_deferred('add_child', instance)


func drop_powerup(g_pos):
	var rand = randf()
	
	if rand > .7:
		var types = ManagerGame.POWERUP_TYPE.values()
		types.shuffle()
		
		var powerup = load("res://actors/objs/Powerup.tscn").instantiate()
		powerup.power_type = types[0]
		spawn_obj(powerup, g_pos)


func get_random_pos():
	var r_pos = Vector2.ZERO
	
	r_pos.x = randf_range($TL.global_position.x, $BR.global_position.x)
	r_pos.y = randf_range($TL.global_position.y, $BR.global_position.y)
	
	return r_pos


func get_random_spawn_point():
	var r_pos = Vector2.ZERO
	
	r_pos.x = randf_range($SpawnPoint.global_position.x, $SpawnPoint2.global_position.x)
	r_pos.y = randf_range($SpawnPoint.global_position.y, $SpawnPoint2.global_position.y)
	
	return r_pos


func get_random_group():
	groups.shuffle()
	
	return groups[0]


func on_enemy_killed(g_pos):
	drop_powerup(g_pos)


func _on_enemy_spawner_timeout():
	var rand = randi_range(0, 1)
	
	if rand == 0:
		var enemy = load("res://actors/entities/Enemy.tscn").instantiate()
		enemy.towards = get_random_pos()
		spawn_obj(enemy, get_random_spawn_point())
	elif rand == 1:
		var group = get_random_group().instantiate()
		spawn_obj(group, get_random_spawn_point())
		
		for pos in group.get_children():
			var enemy = load("res://actors/entities/Enemy_2.tscn").instantiate()
			enemy.towards = Vector2.DOWN
			spawn_obj(enemy, pos.global_position)
			enemy.look_at(pos.global_position + Vector2.DOWN)


func _on_wave_timer_timeout():
	if $EnemySpawner.is_stopped():
		$EnemySpawner.start()
	else:
		$EnemySpawner.stop()
	
	wave += 1
	
	if wave > wave_max:
		$WaveTimer.stop()
		$EnemySpawner.start()
		
		var boss = load("res://actors/entities/Boss_1.tscn").instantiate()
		boss.towards = get_random_pos()
		spawn_obj(boss, get_random_spawn_point())
