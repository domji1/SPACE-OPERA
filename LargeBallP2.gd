extends RigidBody2D
var HP = 17
var Player = 2
var sizescale = 0.02
var damage = 4
class_name LargeBallP2
var Player1 = load("res://Player1.gd")
var P1Turretbase = load("res://P1Turretbase.gd")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2(0, 0), Vector2(400, 0).rotated(rotation))
	$Timer.start(5)
func _process(delta):
	$Sprite.scale.x += sizescale
	$Sprite.scale.y += sizescale
	$CollisionShape2D.scale.x += sizescale
	$CollisionShape2D.scale.y += sizescale
	$Area2D/CollisionShape2D2.scale.x += sizescale
	$Area2D/CollisionShape2D2.scale.y += sizescale
	damage += 0.05
	if HP < 0.0001:
		queue_free()
	if $Timer.time_left == 0:
		queue_free()
	for body in $Area2D.get_overlapping_bodies():
		if body is Asteroid or body is Player1:
			body.HP -= damage
			queue_free()
