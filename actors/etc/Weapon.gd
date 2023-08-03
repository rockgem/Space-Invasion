extends Node2D
class_name Weapon


var bullet = load("res://actors/objs/PlayerBullet.tscn")

var fire_rate = 0.2
var tick = 0.0


func _physics_process(delta):
	# shooting mechanics
	if Input.is_action_pressed("shoot"):
		tick += delta
		if tick >= fire_rate:
			shoot()
			
			tick = 0.0

# any script that inherits this class (Weapons) will have a function shoot()
# which you can use to execute code to customise how each weapons will behave
# for example, a weapon may shoot 2 bullets (Weapon_2.tscn)
func shoot():
	pass
