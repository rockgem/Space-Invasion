extends Node2D

var speed = 60.0
var dir = Vector2.ZERO


func _physics_process(delta):
	global_position += dir * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
