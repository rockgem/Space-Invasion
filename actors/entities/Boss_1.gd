extends Node2D



func _ready():
	look_at(global_position + Vector2.DOWN)
	
	$BossMovementComponent.target = Vector2(global_position.x, global_position.y + 86)


func _on_hurt_box_component_hp_zero():
	ManagerGame.boss_killed.emit()
	
	queue_free()
