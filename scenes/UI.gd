extends Control



func _ready():
	ManagerGame.player_hit.connect(on_player_hit)


func refresh_hud():
	$HP.value = ManagerGame.global_player_ref.hp
	
	for child in $HeartsBox.get_children():
		child.queue_free()
	
	for i in range(ManagerGame.global_player_ref.life):
		var tex = TextureRect.new()
		tex.custom_minimum_size = Vector2(16, 16)
		tex.texture = load("res://assets/ui/heart.png")
		
		$HeartsBox.add_child(tex)


func set_hud():
	$HP.max_value = ManagerGame.global_player_ref.hp
	$HP.value = ManagerGame.global_player_ref.hp


func on_player_hit():
	refresh_hud()
