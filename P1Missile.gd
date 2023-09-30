extends KinematicBody2D

var ACCEL = 70
var MAXSPEED = 1000
var Velocity = Vector2.ZERO
var Player = 1

func _physics_process(delta):
	Velocity = Velocity + Vector2(ACCEL, 0).rotated(rotation)
	var t = preload("res://Trail.tscn")
	var T = t.instance()
	T.global_position = $Position2D3.global_position
	T.global_rotation = global_rotation
	T.set_as_toplevel(true)
	get_parent().add_child(T)
	if Velocity.length() > MAXSPEED:
		Velocity = MAXSPEED * Velocity.normalized()
		
	Velocity = move_and_slide(Velocity)
	for body in $Area2D.get_overlapping_bodies():
		if body is TileMap or body is Player2 or body is Asteroid or body is P1punch or body is P2punch or body is P2Turretbase or body is LargeBallP2:
			var bullet = preload("res://P1Explosion.tscn")
			var Bullet = bullet.instance()
			Bullet.global_position = global_position
			Bullet.global_rotation = global_rotation
			Bullet.set_as_toplevel(true)
			get_parent().add_child(Bullet)
			queue_free()
