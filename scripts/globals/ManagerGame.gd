extends Node


signal player_hit
signal enemy_killed


enum POWERUP_TYPE{
	HEAL,
	ATTACK
}


var global_world_ref = null
var global_player_ref = null



func process_powerup(type: int):
	match type:
		POWERUP_TYPE.HEAL:
			global_player_ref.hp += 1
			
			player_hit.emit()
		POWERUP_TYPE.ATTACK:
			pass
