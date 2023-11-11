extends Node3D

@export var mouse_sensitivity: float = 0.1
@export var hand_thrust_distance: float = 1.0
@export var hand_reset_speed: float = 5.0

# Private variables
var head_rotation := Vector2()

# Nodes for left and right hands
@onready var left_hand: Node3D = $Head/LeftHand
@onready var right_hand: Node3D = $Head/RightHand

func _process(delta):
	# Head tracking
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):  #Use middle mouse to activate head tracking
		var mouse_motion = Input.get_last_mouse_velocity()
		head_rotation.x += -mouse_motion.x * mouse_sensitivity
		head_rotation.y += -mouse_motion.y * mouse_sensitivity
		head_rotation.y = clamp(head_rotation.y, -90, 90) # Limit vertical rotation
		
		$Head.rotation_degrees = Vector3(head_rotation.y, head_rotation.x, 0)

	# Hand Thrust Sim
	
	# Left Hand
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		left_hand.global_transform.origin.z = -hand_thrust_distance
	else:
		# Lerp the hand back to the starting position
		var current_position = left_hand.global_transform.origin
		left_hand.global_transform.origin.z = lerp(current_position.z, 0.0, delta * hand_reset_speed)
		
	# Right Hand
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		right_hand.global_transform.origin.z = -hand_thrust_distance
	else:
		# Lerp the hand back to the starting position
		var current_position = right_hand.global_transform.origin
		right_hand.global_transform.origin.z = lerp(current_position.z, 0.0, delta * hand_reset_speed)
