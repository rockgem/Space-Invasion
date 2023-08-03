extends Node2D


var power_type = ManagerGame.POWERUP_TYPE.HEAL


func _ready():
	pass


func _physics_process(delta):
	global_position.y += 50 * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


# when this powerup collided with PlayerHurtbox
func _on_area_2d_area_entered(area):
	queue_free()
