extends RigidBody2D
var HP = 3074938
var MAXSPEED = 300
var Player = 1
class_name P1Turretbase
var rng = RandomNumberGenerator.new()
var P2Turretbase = load("res://P2Turretbase.gd")
var bullet = load("res://BulletP1.tscn")
var BULLET = bullet.instance()

func _ready():
	rng.randomize()
	apply_impulse(Vector2(0, 0), Vector2(500, 0).rotated(rotation))
func _process(delta):
	if linear_velocity.length() > MAXSPEED:
		linear_velocity = MAXSPEED * linear_velocity.normalized()
	MAXSPEED -= 3
	$Turret.global_rotation_degrees = Manager.P1rota
	if HP < 1:
		queue_free()

	if $Timer.time_left == 0:
		global_position.x = 123443
	#	queue_free()
