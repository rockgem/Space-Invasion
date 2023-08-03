extends CharacterBody2D


var vel = Vector2.ZERO
var move_speed = 100.0


func _physics_process(delta):
	vel.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	vel.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	velocity = vel * move_speed
	
	move_and_slide()
