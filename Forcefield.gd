extends KinematicBody2D

var Velocity = Vector2.ZERO
var Player1 = load("res://Player1.gd")
var Player2 = load("res://Player2.gd")
var rng = RandomNumberGenerator.new()
var Player = 0

func _ready():
	rng.randomize()

func _physics_process(delta):
	for body in $Area2D2.get_overlapping_bodies():
		if Player == 1:
			if body is Player2:
				body.MAXSPEED = Manager.MaxiP2
	for body in $Area2D.get_overlapping_bodies():
		if Player == 1:
			if body is Player2:
				body.MAXSPEED = 12
	for body in $Area2D2.get_overlapping_bodies():
		if Player == 2:
			if body is Player1:
				body.MAXSPEED = Manager.MaxiP1
	for body in $Area2D.get_overlapping_bodies():
		if Player == 2:
			if body is Player1:
				body.MAXSPEED = 12
	if $Timer.time_left == 0:
		if Player == 1:
			for body in $Area2D2.get_overlapping_bodies():
				if body is Player2:
					body.MAXSPEED = Manager.MaxiP2
		if Player == 2:
			for body in $Area2D2.get_overlapping_bodies():
				if body is Player1:
					body.MAXSPEED = Manager.MaxiP1
		queue_free()

