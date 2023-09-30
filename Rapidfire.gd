extends KinematicBody2D

var Player = 1
var ACCEL = 450
var MAXSPEED = 450
var Velocity = Vector2.ZERO
var Player2 = load("res://Player2.gd")
var Player1 = load("res://Player1.gd")
func _physics_process(delta):
	Velocity = Velocity + Vector2(ACCEL, 0).rotated(rotation)
	if Velocity.length() > MAXSPEED:
		Velocity = MAXSPEED * Velocity.normalized()
		
	Velocity = move_and_slide(Velocity)
	Manager.P1Ready = 0
	for body in $Area2D.get_overlapping_bodies():
		if not body is Player1:
			body.HP -= 3
			Manager.P1Ready = 1
			queue_free()

