extends Node

func _physics_process(delta):
	$ProgressBar.value = Manager.P1Health
	$ProgressBar2.value = Manager.P2Health
	$ProgressBar.max_value = Manager.P1HealthMax
	$ProgressBar2.max_value = Manager.P2HealthMax
	$HBoxContainer/ViewportContainer/Viewport/Camera2D.zoom = Vector2(Manager.P1Zoom, Manager.P1Zoom)
	$HBoxContainer/ViewportContainer2/Viewport/Camera2D.zoom = Vector2(Manager.P2Zoom, Manager.P2Zoom)


func _ready():
	$HBoxContainer/ViewportContainer2/Viewport.world_2d = $HBoxContainer/ViewportContainer/Viewport.world_2d
	var Remotetransform = RemoteTransform2D.new()
	Remotetransform.remote_path = $HBoxContainer/ViewportContainer/Viewport/Camera2D.get_path()
	$HBoxContainer/ViewportContainer/Viewport/World/Player1.add_child(Remotetransform)
	var Remotetransform2 = RemoteTransform2D.new()
	Remotetransform2.remote_path = $HBoxContainer/ViewportContainer2/Viewport/Camera2D.get_path()
	$HBoxContainer/ViewportContainer/Viewport/World/Player2.add_child(Remotetransform2)
