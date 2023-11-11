extends Node3D

var interface : XRInterface

func _ready() -> void:
	interface = XRServer.find_interface("OpenXR")
	if interface and interface.is_initialized():
		print("INITIALIZED!")
		get_viewport().use_xr = true
