extends Sprite2D

signal arrow_clicked(arrow: Sprite2D)

# Emits a signal when clicked on
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			arrow_clicked.emit(self)
