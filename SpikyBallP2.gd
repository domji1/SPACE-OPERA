extends RigidBody2D
var Player = 2
var sizescale = 0.02
var damage = 4.5
var Player1 = load("res://Player1.gd")

func _ready():
	apply_impulse(Vector2(0, 0), Vector2(700, 0).rotated(rotation))
func _process(delta):
	if $Timer.time_left == 0:
		queue_free()
	for body in $Area2D.get_overlapping_bodies():
		if body is Asteroid or body is Player1 or body is LargeBallP1:
			body.HP -= damage
			queue_free()

