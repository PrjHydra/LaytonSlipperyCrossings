extends Node2D

@export var wall_list: Array[Node2D] = []

# Check if a segment of the barrier is active
func checkBarrier(wallid:int, number:int) -> bool:
	return wall_list[wallid].activation_status[number]

# Updates the visbility of the sprite based on the activation status
func updateVisibility():
	for wall in wall_list:
		for i in wall.activation_status.size():
			if wall.activation_status[i]:
				wall.sprite_list[i].visible = true
			else:
				wall.sprite_list[i].visible = false

func _ready() -> void:
	updateVisibility()
