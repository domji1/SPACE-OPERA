extends RigidBody2D

var Player = 2
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2(0, 0), Vector2(400, 0).rotated(rotation))
	$Timer.start(1.75)


# Called every frame. 'delta' is the elapsed time since the previous frame.




func _on_Timer_timeout():
	var bullet = preload("res://P1Explosion.tscn")
	var Bullet = bullet.instance()
	Bullet.global_position = global_position
	Bullet.global_rotation = global_rotation
	Bullet.set_as_toplevel(true)
	get_parent().add_child(Bullet)
	queue_free()


func _on_Area2D_body_entered(body):
	if body.get("PPP"):
		if body.PPP == 1:
			var bullet = preload("res://P1Explosion.tscn")
			var Bullet = bullet.instance()
			Bullet.global_position = global_position
			Bullet.global_rotation = global_rotation
			Bullet.set_as_toplevel(true)
			get_parent().add_child(Bullet)
			queue_free()
