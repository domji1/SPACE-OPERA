extends RigidBody2D
var damage = 1
var Player = 3
var HP = 0


func _ready():
	damage = 1
	apply_impulse(Vector2(0, 0), Vector2(700, 0).rotated(rotation))
	$Timer.start(6)
func _process(delta):
	if $Timer.time_left == 0:
		queue_free()
