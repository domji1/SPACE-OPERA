extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var fanishis = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fanishis += 1
	if fanishis == 10:
		queue_free()



func _on_Area2D_body_entered(body):
	if body is RigidBody2D:
		body.applied_torque = 450000
		body.linear_velocity = Vector2(0,0)
		body.HP -= 4
