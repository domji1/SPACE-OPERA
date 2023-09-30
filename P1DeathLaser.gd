extends RayCast2D

var Damage = 8
export (Color) var LaserColor

func Fire():
	$Line2D.default_color = LaserColor
	cast_to = Vector2.ZERO
	while get_collider() == null:
		cast_to.x += 2
		force_raycast_update()
	$Line2D.points[1].x = cast_to.x
	$AnimationPlayer.play("Fire")
	
	
func _physics_process(delta):
	if $Line2D.width != 0:
		cast_to = Vector2.ZERO
		while get_collider() == null:
			cast_to.x += 2
			force_raycast_update()
		$Line2D.points[1].x = cast_to.x
		if get_collider() != null:
			if "HP" in get_collider():
				get_collider().HP -= Damage
