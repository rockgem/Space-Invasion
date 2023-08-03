extends Node2D


var power_type = ManagerGame.POWERUP_TYPE.HEAL


func _ready():
	match power_type:
		ManagerGame.POWERUP_TYPE.HEAL:
			$Sprite2D.texture = load("res://assets/Powerups/powerup1.png")
		ManagerGame.POWERUP_TYPE.ATTACK:
			$Sprite2D.texture = load("res://assets/Powerups/powerup2.png")
		ManagerGame.POWERUP_TYPE.LIFE:
			$Sprite2D.texture = load("res://assets/Powerups/powerup3.png")


func _physics_process(delta):
	global_position.y += 50 * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


# when this powerup collided with PlayerHurtbox
func _on_area_2d_area_entered(area):
	ManagerGame.process_powerup(power_type)
	
	queue_free()
