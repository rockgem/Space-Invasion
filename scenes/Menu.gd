extends Control



func _ready():
	get_tree().paused = false


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/World.tscn")
