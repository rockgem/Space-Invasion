extends CharacterBody2D

var vel = Vector2.ZERO
var move_speed = 100.0
var hp = 5
var life = 3


var weapon_level = 1


func _ready():
	ManagerGame.global_player_ref = self


func _physics_process(delta):
	# movement code
	vel.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	vel.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	velocity = vel * move_speed
	
	move_and_slide()


func change_weapon(weapon_id):
	var weapon = load("res://actors/etc/%s.tscn" % weapon_id).instantiate()
	
	if weapon:
		for child in $WeaponHolder.get_children():
			child.queue_free()
		
		$WeaponHolder.add_child(weapon)


func _on_player_hurtbox_area_entered(area):
	area.get_parent().queue_free()
	
	hp -= 1
	
	if hp <= 0:
		life -= 1
		
		hp = 5
	
	ManagerGame.player_hit.emit()
	ManagerGame.global_world_ref.cam_shake()
	
