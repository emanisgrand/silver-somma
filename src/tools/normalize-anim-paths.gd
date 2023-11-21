@tool
extends Node

func _ready():
	# Make sure this code only runs in the editor
	if Engine.is_editor_hint:
		retarget_animations()

func retarget_animations():
	var current_scene = get_tree().edited_scene_root
	
	if not current_scene:
		print("No current scene found")
		return
	
	var anim_player = current_scene.find_node("AnimationPlayer", true, false) # true for recursive, false for own_nodes_only
	if not anim_player:
		print("AnimationPlayer node not found")
		return
		
	for anim_name in anim_player.get_animation_list():
		var anim = anim_player.get_animation(anim_name)
		for track_idx in range(anim.get_track_count()):
			var old_path = anim.track_get_path(track_idx)
			#Check if the track path contains the skeleton's node path
			var path_parts = old_path.split(":")
			if path_parts.size() > 1: #Ensure there's a property name after the node path
				var node_path = path_parts[0]
				# Replace only the node path part if it's not the generic path
				if node_path != "Skeleton3D":
					var new_node_path = "Skeleton3D"
					var new_path = new_node_path + ":" + path_parts[1]
					anim.track_set_path(track_idx, new_path)
					print("Updated track path from " + old_path + " to " + new_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func remove_self():
	if Engine.is_editor_hint:
		get_owner().remove_child(self)
		queue_free()
