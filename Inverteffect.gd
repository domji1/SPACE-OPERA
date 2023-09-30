extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var steps = 0
var Velocity = Vector2.ZERO
var rng = RandomNumberGenerator.new()
var pos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = global_position
	rng.randomize()
	rotation_degrees = rng.randi_range(1,360)
	Velocity = Vector2(6000, 0).rotated(rotation)
	move_and_slide(Velocity)
	rotation_degrees = -rotation_degrees


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Velocity = Vector2(100, 0).rotated(rotation)
	move_and_slide(Velocity)
	steps += 1
	if steps == 60:
		queue_free()
