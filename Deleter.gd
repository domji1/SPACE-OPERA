extends KinematicBody2D

var ACCEL = 500
var MAXSPEED = 500
var Velocity = Vector2.ZERO
var Player1 = load("res://Player1.gd")
var rng = RandomNumberGenerator.new()
var Player = 0

func _ready():
	rng.randomize()

func _physics_process(delta):

	Velocity = Velocity + Vector2(ACCEL, 0).rotated(rotation)
	if Velocity.length() > MAXSPEED:
		Velocity = MAXSPEED * Velocity.normalized()
		
	Velocity = move_and_slide(Velocity)
	for body in $Area2D.get_overlapping_bodies():
		if Player == 1:
			if  body.Player == 2 or body.Player == 3:
				body.queue_free()
				scale.x += 1
				scale.y += 1
	for body in $Area2D.get_overlapping_bodies():
		if Player == 2:
			if  body.Player == 1 or body.Player == 3:
				body.queue_free()
				scale.x += 1
				scale.y += 1


