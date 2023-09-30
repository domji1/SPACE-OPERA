extends KinematicBody2D
var HP = 1
var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	pass # Replace with function body.
func _process(delta):
	if $Timer2.time_left == 0:
		for i in 20:
			var bullet = preload("res://BulletP1.tscn")
			var Bullet = bullet.instance()
			Bullet.global_position = $Position2D.global_position
			Bullet.global_rotation_degrees = global_rotation_degrees
			Bullet.global_rotation_degrees += rng.randf_range(-15, 15)
			Bullet.set_as_toplevel(true)
			add_child(Bullet)
		global_position.x = 326781
		$Timer2.start(959767576)

