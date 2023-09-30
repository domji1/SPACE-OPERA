extends KinematicBody2D
var Player1 = load("res://Player1.gd")
var P1Turretbase = load("res://P1Turretbase.gd")
var Asteroid = load("res://Asteroid.gd")
var Player = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(10)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Timer.time_left == 0:
			var bullet = preload("res://P1Explosion.tscn")
			var Bullet = bullet.instance()
			Bullet.global_position = global_position
			Bullet.global_rotation = global_rotation
			Bullet.set_as_toplevel(true)
			get_parent().add_child(Bullet)
			queue_free()
	for body in $Area2D.get_overlapping_bodies():
		if body is Player1 or body is Asteroid:
			for i in 2:
				var bullet = preload("res://P1Explosion.tscn")
				var Bullet = bullet.instance()
				Bullet.global_position = global_position
				Bullet.global_rotation = global_rotation
				Bullet.set_as_toplevel(true)
				get_parent().add_child(Bullet)
			queue_free()

