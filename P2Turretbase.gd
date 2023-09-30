extends RigidBody2D
var HP = 3074938
var MAXSPEED = 300
var Player = 2
class_name P2Turretbase
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
	$TurretP2.global_rotation_degrees = Manager.P2rota
	if HP < 1:
		queue_free()

	if $Timer.time_left == 0:
		global_position.x = 123443
