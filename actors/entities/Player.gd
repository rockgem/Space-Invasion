extends CharacterBody2D

var bullet = load("res://actors/objs/PlayerBullet.tscn")


var vel = Vector2.ZERO
var move_speed = 100.0
var hp = 5
var life = 3

var fire_rate = 0.2
var tick = 0.0


func _ready():
	ManagerGame.global_player_ref = self


func _physics_process(delta):
	# movement code
	vel.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	vel.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	velocity = vel * move_speed
	
	move_and_slide()
	
	# shooting mechanics
	if Input.is_action_pressed("shoot"):
		tick += delta
		if tick >= fire_rate:
			var i = bullet.instantiate()
			i.dir = Vector2.UP
			ManagerGame.global_world_ref.spawn_obj(i, global_position)
			
			tick = 0.0


func _on_player_hurtbox_area_entered(area):
	area.get_parent().queue_free()
	
	hp -= 1
	
	if hp <= 0:
		life -= 1
		
		hp = 5
	
	ManagerGame.player_hit.emit()
	ManagerGame.global_world_ref.cam_shake()
	
