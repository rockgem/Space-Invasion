extends CharacterBody2D

var bullet = load("res://actors/objs/PlayerBullet.tscn")


var vel = Vector2.ZERO
var move_speed = 100.0


func _physics_process(delta):
	vel.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	vel.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	velocity = vel * move_speed
	
	move_and_slide()


func _input(event):
	if Input.is_action_pressed("shoot"):
		var i = bullet.instantiate()
		i.dir = Vector2.UP
		ManagerGame.global_world_ref.spawn_obj(i, global_position)
