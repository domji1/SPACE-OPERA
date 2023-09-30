extends RigidBody2D
class_name P1punch
var damage = 1
var Player = 1
var HP = 0
var Player2 = load("res://Player2.gd")

func _ready():
	damage = 1
	apply_impulse(Vector2(0, 0), Vector2(-1000, 0).rotated(rotation))
	$Timer.start(4)
func _process(delta):
	for body in $Area2D.get_overlapping_bodies():
		if body is Player2 or body is P2Turretbase:
			if damage == 1:
				body.HP -= 3
				damage = 0
	if $Timer.time_left == 0:
		queue_free()
