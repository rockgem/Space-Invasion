extends Node


@onready var parent = get_parent()

@export var move_speed = 30.0
var target = Vector2.ZERO



func _ready():
	pass


func _physics_process(delta):
	if target != Vector2.ZERO:
		var dif = parent.global_position.direction_to(target)
		
		parent.global_position += dif * move_speed * delta
		
		if parent.global_position.distance_to(target) < 1.0:
			target = Vector2.ZERO


func _on_timer_timeout():
	target = ManagerGame.global_world_ref.get_random_pos()
