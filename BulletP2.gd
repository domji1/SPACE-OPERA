extends KinematicBody2D

var Player = 2
var ACCEL = 600
var MAXSPEED = 600
var Velocity = Vector2.ZERO
var Player2 = load("res://Player2.gd")

func _physics_process(delta):
	Velocity = Velocity + Vector2(ACCEL, 0).rotated(rotation)
	if Velocity.length() > MAXSPEED:
		Velocity = MAXSPEED * Velocity.normalized()
		
	Velocity = move_and_slide(Velocity)
	for body in $Area2D.get_overlapping_bodies():
		if not body is Player2 and  not body is P2Turretbase:
			body.HP -= 3
			queue_free()
