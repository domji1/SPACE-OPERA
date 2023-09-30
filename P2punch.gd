extends RigidBody2D

class_name P2punch
var damage = 1
var Player = 2
var HP = 0
var Player1 = load("res://Player1.gd")
var P1Turretbase = load("res://P1Turretbase.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	damage = 1
	apply_impulse(Vector2(0, 0), Vector2(-1000, 0).rotated(rotation))
	$Timer.start(4)

func _process(delta):
	for body in $Area2D.get_overlapping_bodies():
		if body is Player1 or body is P1Turretbase:
			if damage == 1:
				body.HP -= 3
				damage = 0
	if $Timer.time_left == 0:
		queue_free()
