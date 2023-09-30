extends Node

var MaxiP1
var MaxiP2
var WeaponP1 = 0
var WeaponP2 = 0
var Player1Pos = Vector2.ZERO
var Player2Pos = Vector2.ZERO
var P1rota = 0
var P2rota = 0
var P1Health = 0
var P2Health = 0
var P1cannotsee = 0
var P2cannotsee = 0
var P1HealthMax = 0
var P2HealthMax = 0
var P1Zoom = 1.2
var P2Zoom = 1.2
var PossibleShips = [load("res://Spaceships/Default.tres"), load("res://Spaceships/Accel.tres"), load("res://Spaceships/Large.tres"), load("res://Spaceships/Small.tres"), load("res://Spaceships/FarSee.tres"), load("res://Spaceships/AsteroidShip.tres"), load("res://Spaceships/HeavyWall.tres"), load("res://Spaceships/GigaGravity.tres")]
var P1Ready = 1
var P2Ready = 1
var rng = RandomNumberGenerator.new()
var Map

func _ready():
	rng.randomize()
	Map = rng.randi_range(1,7)
	
