extends RigidBody2D

var MAXSPEED = 100
var SPEED = 52
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2(0, 0), Vector2(SPEED*50, 0).rotated(rotation))

func _process(delta):
	if linear_velocity.length() > MAXSPEED:
		linear_velocity = MAXSPEED * linear_velocity.normalized()
	for body in $Area2D2.get_overlapping_bodies():
		if body is Player2:
			look_at(body.global_position)
	apply_impulse(Vector2(0, 0), Vector2(SPEED, 0).rotated(rotation))
