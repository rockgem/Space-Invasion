extends Node


signal player_hit
signal enemy_killed


enum POWERUP_TYPE{
	HEAL,
	ATTACK,
	LIFE
}


var global_world_ref = null
var global_player_ref = null



func process_powerup(type: int):
	match type:
		POWERUP_TYPE.HEAL:
			global_player_ref.hp = clamp(global_player_ref.hp + 1, 0, 5)
			
			player_hit.emit()
		POWERUP_TYPE.ATTACK:
			pass
		POWERUP_TYPE.LIFE:
			global_player_ref.life = clamp(global_player_ref.life + 1, 0, 3)
			
			player_hit.emit()
