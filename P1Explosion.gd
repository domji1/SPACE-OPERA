extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(0.05)

func _process(delta):
	if $Timer.time_left == 0:
		for body in $Area2D.get_overlapping_bodies():
			body.HP -= 10
		queue_free()
