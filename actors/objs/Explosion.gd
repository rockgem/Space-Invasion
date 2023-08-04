extends Node2D


func _ready():
	Sfx.get_node("Explosion").play()


func _on_animated_sprite_2d_animation_finished():
	queue_free()
