extends KinematicBody2D

var Player = 2
var ACCEL = 400
var MAXSPEED = 400
var Velocity = Vector2.ZERO
var HP = 10787078897089
var Player1 = load("res://Player1.gd")
var Player2 = load("res://Player2.gd")
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	rotation_degrees += rng.randf_range(-20,20)

func _physics_process(delta):
	rotation_degrees += rng.randf_range(-2,2)
	Velocity = Velocity + Vector2(ACCEL, 0).rotated(rotation)
	if Velocity.length() > MAXSPEED:
		Velocity = MAXSPEED * Velocity.normalized()
		
	Velocity = move_and_slide(Velocity)
	for body in $Area2D.get_overlapping_bodies():
		if not body is Player2 and  not body is P2Turretbase and body is RigidBody2D:
			body.HP -= 3.5
			# body.apply_impulse(Vector2(rng.randf_range(-100,100), 0) Vector2(rng.randf_range(-100,100), 0).rotated(rotation))
			queue_free()
		if body is TileMap:
			queue_free()
