extends RigidBody2D
class_name Asteroid
var HP = 12
var Player = 3
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	apply_impulse(Vector2(0, 0), Vector2(0, -rng.randi_range(350, 500)).rotated(rotation))
	scale.x = rng.randf_range(3, 7)
	scale.y = scale.x
	for i in get_children():
		i.scale = scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if HP < 0.0001:
		queue_free()
	applied_torque = 0
