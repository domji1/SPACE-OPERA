extends TileMap
var Player = 0
var HP =1
export var Number = 1

func _physics_process(delta):
	if Manager.Map == Number:
		global_position.x = -62
		global_position.y = -66
	else:
		global_position.x = 650000
		global_position.y = 650000
