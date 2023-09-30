extends KinematicBody2D

var Player = 1
var ACCEL = 600
var MAXSPEED = 600
var Velocity = Vector2.ZERO
var HP = 10787078897089
var Player1 = load("res://Player1.gd")
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	print("hdjhjkds")

func _physics_process(delta):

	Velocity = Velocity + Vector2(ACCEL, 0).rotated(rotation)
	if Velocity.length() > MAXSPEED:
		Velocity = MAXSPEED * Velocity.normalized()
		
	Velocity = move_and_slide(Velocity)
	for body in $Area2D.get_overlapping_bodies():
		if not body is Player1 and  not body is P1Turretbase:
			body.HP -= 3
			queue_free()
