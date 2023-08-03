extends Control



func _ready():
	ManagerGame.player_hit.connect(on_player_hit)
	
	$HP.max_value = ManagerGame.global_player_ref.hp
	$HP.value = ManagerGame.global_player_ref.hp


func on_player_hit():
	$HP.value = ManagerGame.global_player_ref.hp
