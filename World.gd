extends Node2D
var rng = RandomNumberGenerator.new()
var Asteroid = preload("res://Asteroid.tscn")
var P2blind = 0
var P1blind = 0
func _ready():
	rng.randomize()
	for i in 80:
		var ASTEROID = Asteroid.instance()
		ASTEROID.global_position = Vector2(rng.randi_range(-1044, 1375), rng.randi_range(-746, 1000))
		ASTEROID.global_rotation_degrees = rng.randi_range(0, 360)
		ASTEROID.set_as_toplevel(true)
		add_child(ASTEROID)
func _process(delta):
	if Manager.P2cannotsee == 1:
		if P2blind == 0:
			P2blind = 1
		if P2blind == 1:
			$BlindnessTimerP2.start(9)
			P2blind = 2
		if $BlindnessTimerP2.time_left == 0:
			Manager.P2cannotsee = 0
			P2blind = 0
	if Manager.P1cannotsee == 1:
		if P1blind == 0:
			P1blind = 1
		if P1blind == 1:
			$BlindnessTimerP1.start(9)
			P1blind = 2
		if $BlindnessTimerP1.time_left == 0:
			Manager.P1cannotsee = 0
			P1blind = 0
