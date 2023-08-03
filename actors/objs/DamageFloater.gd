extends Node2D


func _ready():
	var t = create_tween()
	t.tween_property(self, 'global_position:y', global_position.y - 32, 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	
	await t.finished
	
	queue_free()
