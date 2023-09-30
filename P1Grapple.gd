extends KinematicBody2D

var ACCEL = 500
var MAXSPEED = 500
var Velocity = Vector2.ZERO
var HP = 10


func _physics_process(delta):
	Velocity = Velocity + Vector2(ACCEL, 0).rotated(rotation)
	if Velocity.length() > MAXSPEED:
		Velocity = MAXSPEED * Velocity.normalized()
		
	Velocity = move_and_slide(Velocity)
	for body in $Area2D.get_overlapping_bodies():
		queue_free()
	
