extends Control

# Restarts the level once the restart button is pressed
func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
