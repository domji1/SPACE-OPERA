extends RigidBody2D

class_name Player1
var HP = 80
var MAXSPEED = 300
var SPEED = 6
var TURNSPEED = 80*4
var Weapon = 0
var Item = 0
var rng = RandomNumberGenerator.new()
var Player = 0
var PPP = 1
var Charge = 0
var SpikyTurn = -15
var Ship
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func LoadShip(LoadedShip):
	LoadedShip = ResourceLoader.load(LoadedShip.resource_path)
	Ship = LoadedShip
	if LoadedShip is ShipData:
		MAXSPEED = LoadedShip.MaxSpeed
		gravity_scale = LoadedShip.GravityScale
		mass = LoadedShip.Mass
		SPEED = LoadedShip.Speed
		HP = LoadedShip.Health
		TURNSPEED = LoadedShip.TurnSpeed
		$Sprite.texture = LoadedShip.P1Text
		Manager.P1Zoom = LoadedShip.Zoom
		
		for n in get_children():
			if n is Node2D:
				n.scale = Vector2(LoadedShip.Scale, LoadedShip.Scale)
		if LoadedShip.resource_path == "res://Spaceships/AsteroidShip.tres":
			$CollisionShape2D.queue_free()
			var Ast = load("res://Asteroid.tscn").instance()
			add_child(Ast.get_node("CollisionPolygon2D").duplicate())
			scale.x = rng.randf_range(3, 7)
			scale.y = scale.x
			for i in get_children():
				if i is Node2D:
					i.scale = scale
		#Manager.P1Health = LoadedShip.Health
	

# Called when the node enters the scene tree for the first time.
func _ready():
	Manager.MaxiP1 = MAXSPEED
	rng.randomize()
	LoadShip(Manager.PossibleShips[rng.randi_range(0, len(Manager.PossibleShips)-1)])
	Item = rng.randi_range(1, 9)
	Weapon = rng.randi_range(1, 9)
	Manager.P1HealthMax = HP
	Manager.WeaponP1 = Weapon
	$P1DeathLaser.set_as_toplevel(true)
	$P1DeathLaser.scale = Vector2(1, 1)
	$GigaGravity.scale = Vector2(5, 5)
	if Ship.GravAbility == 0:
		$GigaGravity.queue_free()
	
func _process(delta):
	if Ship.GravAbility == 1:
		var bullet = preload("res://Inverteffect.tscn")
		var Bullet = bullet.instance()
		Bullet.global_position = $GigaGravity/Position2D.global_position
		Bullet.global_rotation = global_rotation
		Bullet.set_as_toplevel(true)
		get_parent().add_child(Bullet)
	$P1DeathLaser.global_position = global_position
	$P1DeathLaser.global_rotation = global_rotation
	Manager.Player1Pos = global_position
	Manager.P1rota = rotation_degrees
	Manager.P1Health = HP
	if HP < 0.00000001:
		queue_free()
	if linear_velocity.length() > MAXSPEED:
		linear_velocity = MAXSPEED * linear_velocity.normalized()
	if Input.is_action_pressed("w"):
		if Ship.HasTrail:
			var bullet = preload("res://Trail.tscn")
			var Bullet = bullet.instance()
			Bullet.global_position = $Position2D3.global_position
			Bullet.global_rotation = global_rotation
			Bullet.set_as_toplevel(true)
			get_parent().add_child(Bullet)
		apply_impulse(Vector2(0, 0), Vector2(SPEED, 0).rotated(rotation))
	if Input.is_action_pressed("s"):
		apply_impulse(Vector2(0, 0), Vector2(-SPEED/3, 0).rotated(rotation))
	if Input.is_action_pressed("a"):
		applied_torque = -TURNSPEED
	elif Input.is_action_pressed("d"):
		applied_torque = TURNSPEED
	else:
		applied_torque = 0
	if Weapon == 1:
		if Input.is_action_pressed("2"):
			if $WTimer.time_left == 0:
				var bullet = preload("res://BulletP1.tscn")
				var Bullet = bullet.instance()
				Bullet.global_position = $Position2D.global_position
				Bullet.global_rotation = global_rotation
				Bullet.set_as_toplevel(true)
				get_parent().add_child(Bullet)
				$WTimer.start(0.2)
	if Weapon == 2:
		if Input.is_action_pressed("2"):
			if $WTimer.time_left == 0:
				var bullet = preload("res://P1Missile.tscn")
				var Bullet = bullet.instance()
				Bullet.global_position = $Position2D.global_position
				Bullet.global_rotation = global_rotation
				Bullet.set_as_toplevel(true)
				get_parent().add_child(Bullet)
				$WTimer.start(0.75)
	if Weapon == 3:
		if Input.is_action_pressed("2"):
			if $WTimer.time_left == 0:
				var bullet = preload("res://LargeBall.tscn")
				var Bullet = bullet.instance()
				Bullet.global_position = $Position2D.global_position
				Bullet.global_rotation = global_rotation
				Bullet.set_as_toplevel(true)
				get_parent().add_child(Bullet)
				$WTimer.start(1.6)
	if Weapon == 4:
		if Input.is_action_pressed("2"):
			if $WTimer.time_left == 0:
				var bullet = preload("res://P1Turretbase.tscn")
				var Bullet = bullet.instance()
				Bullet.global_position = $Position2D.global_position
				Bullet.global_rotation = global_rotation
				Bullet.set_as_toplevel(true)
				get_parent().add_child(Bullet)
				$WTimer.start(2.3)
	if Weapon == 5:
		if Input.is_action_pressed("2"):
			if $WTimer.time_left == 0:
				var bullet = preload("res://Boomerang.tscn")
				var Bullet = bullet.instance()
				Bullet.global_position = $Position2D.global_position
				Bullet.global_rotation = global_rotation
				get_parent().add_child(Bullet)
				$WTimer.start(1.35)
	if Weapon == 6:
		if Input.is_action_pressed("2"):
			if Charge < 6500/12:
				Charge += 2
		if Input.is_action_just_released("2"):
			for i in Charge/50:
				var punch = preload("res://ChargefireP1.tscn")
				var Punch = punch.instance()
				Punch.global_position = $Position2D.global_position
				Punch.rotation = rotation
				Punch.set_as_toplevel(true)
				add_child(Punch)
			Charge = 0
	if Weapon == 7:
		if Input.is_action_pressed("2"):
			if $WTimer.time_left == 0:
				for i in 3:
					var bullet = preload("res://SpikyBallP1.tscn")
					var Bullet = bullet.instance()
					Bullet.global_position = $Position2D.global_position
					Bullet.global_rotation = global_rotation
					Bullet.set_as_toplevel(true)
					Bullet.global_rotation_degrees += SpikyTurn
					SpikyTurn += 15
					get_parent().add_child(Bullet)
				SpikyTurn = -15
				$WTimer.start(2)
	if Weapon == 8:
		if Input.is_action_pressed("2"):
			if $WTimer.time_left == 0:
				$P1DeathLaser.Fire()
				$WTimer.start(2)
	if Weapon == 9:
		if Input.is_action_pressed("2"):
			if $ITimer.time_left == 0:
				var punch = preload("res://GrenadeP1.tscn")
				var Punch = punch.instance()
				Punch.global_position = $Position2D.global_position
				Punch.rotation = rotation
				Punch.set_as_toplevel(true)
				add_child(Punch)
				$ITimer.start(0.7)
				
				
	if Item == 1:
		if Input.is_action_pressed("1"):
			if $ITimer.time_left == 0:
				var punch = preload("res://P1punch.tscn")
				var Punch = punch.instance()
				Punch.global_position = $Position2D2.global_position
				Punch.rotation = rotation
				Punch.set_as_toplevel(true)
				add_child(Punch)
				$ITimer.start(1.7)
	if Item == 2:
		if Input.is_action_pressed("1"):
			if $ITimer.time_left == 0:
				var punch = preload("res://SpikeP1.tscn")
				var Punch = punch.instance()
				Punch.global_position = global_position
				Punch.rotation = rotation
				Punch.set_as_toplevel(true)
				add_child(Punch)
				$ITimer.start(2.5)
	if Item == 3:
		if Input.is_action_pressed("1"):
			if $ITimer.time_left == 0 and Manager.P2cannotsee == 0:
				var bullet = preload("res://P1blindnessshot.tscn")
				var Bullet = bullet.instance()
				Bullet.global_position = $Position2D.global_position
				Bullet.global_rotation = global_rotation
				Bullet.set_as_toplevel(true)
				get_parent().add_child(Bullet)
				$ITimer.start(4)
	if Item == 4:
		if Input.is_action_pressed("1"):
			if $ITimer.time_left == 0:
				var bullet = preload("res://Deleter.tscn")
				var Bullet = bullet.instance()
				Bullet.global_position = $Position2D.global_position
				Bullet.global_rotation = global_rotation
				Bullet.set_as_toplevel(true)
				Bullet.Player = 1
				get_parent().add_child(Bullet)
				$ITimer.start(2)
	if Item == 5:
		if Input.is_action_pressed("1"):
			if $ITimer.time_left == 0:
				var bullet = preload("res://Forcefield.tscn")
				var Bullet = bullet.instance()
				Bullet.global_position = global_position
				Bullet.set_as_toplevel(true)
				Bullet.Player = 1
				get_parent().add_child(Bullet)
				$ITimer.start(5.5)
	if Item == 6:
		if Input.is_action_pressed("1"):
			if $ITimer.time_left == 0:
				for i in 50:
					var bullet = preload("res://wallsblock.tscn")
					var Bullet = bullet.instance()
					Bullet.global_position = $Position2D.global_position
					Bullet.global_rotation_degrees = global_rotation_degrees
					Bullet.global_rotation_degrees += rng.randi_range(-25, 25)
					Bullet.set_as_toplevel(true)
					add_child(Bullet)
				$ITimer.start(4.6)
	if Item == 7:
		if Input.is_action_pressed("1"):
			if $ITimer.time_left == 0:
				for i in 1:
					var bullet = preload("res://GravP1.tscn")
					var Bullet = bullet.instance()
					Bullet.global_position = $Position2D.global_position
					Bullet.global_rotation_degrees = global_rotation_degrees
					Bullet.set_as_toplevel(true)
					add_child(Bullet)
				$ITimer.start(4.6)
	if Item == 8:
		if Input.is_action_pressed("1"):
			if $ITimer.time_left == 0:
				for i in 1:
					var bullet = preload("res://ZapperP1.tscn")
					var Bullet = bullet.instance()
					Bullet.global_position = $Position2D.global_position
					Bullet.global_rotation_degrees = global_rotation_degrees
					Bullet.set_as_toplevel(true)
					add_child(Bullet)
				$ITimer.start(2.9)
	if Item == 9:
		if Input.is_action_pressed("1"):
			if $ITimer.time_left == 0:
				if Ship.Scale == 1.701:
					apply_impulse(Vector2(0, 0), Vector2(-1000000, 0).rotated(rotation))
				elif Ship.Scale == 4:
					apply_impulse(Vector2(0, 0), Vector2(-10000, 0).rotated(rotation))
				else:
					apply_impulse(Vector2(0, 0), Vector2(-MAXSPEED*2, 0).rotated(rotation))
				$ITimer.start(2)
