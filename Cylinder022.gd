extends MeshInstance


func _on_StaticBody_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			var v = Vector3(0, 0.1, 0)
			self.translate_object_local(v)
		if event.button_index == BUTTON_RIGHT:
			var v = Vector3(0, -0.1, 0)
			self.translate_object_local(v)

