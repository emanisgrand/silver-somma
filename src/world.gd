extends Node3D

var interface : XRInterface

func _ready() -> void:
	interface = XRServer.find_interface("OpenXR")
	if interface and interface.is_initialized():
		print("OpenXR initialization successful.")
		
		# Turn off v-sync
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	
		# Change main viewport to HMD output
		get_viewport().use_xr = true
