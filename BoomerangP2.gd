extends KinematicBody2D

var ACCEL = 500
var Back = 500
var Velocity = Vector2.ZERO
var Player1 = load("res://Player1.gd")
var Player2 = load("res://Player2.gd")
var rng = RandomNumberGenerator.new()
var Player = 2
var hj = 0

func _ready():
	Velocity = Velocity + Vector2(ACCEL, 0).rotated(rotation)

func _physics_process(delta):
	Velocity = move_and_slide(Velocity)
	for body in $Area2D.get_overlapping_bodies():
		if body is Player1 or body is Asteroid:
			body.HP -= 0.45
	for body in $Area2D.get_overlapping_bodies():
		if body is TileMap:
			hj = 1
	if hj == 1:
		look_at(Manager.Player2Pos)
		Velocity = Vector2(Back, 0).rotated(rotation)
		for body in $Area2D.get_overlapping_bodies():
			if body is Player2:
				queue_free()
