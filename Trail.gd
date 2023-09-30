extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Velocity = Vector2.ZERO
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	rotation_degrees += rng.randf_range(-30,30)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Velocity =Vector2(-250, 0).rotated(rotation)
	move_and_slide(Velocity)


func _on_Timer_timeout():
	queue_free()
