extends Node2D
@export var northArrow: Node2D = null
@export var eastArrow: Node2D = null
@export var southArrow: Node2D = null
@export var westArrow: Node2D = null

var arrowList: Array[Node2D] = []

# Adds all the arrows to the Array and rotates them accordingly
func _ready() -> void:
	arrowList.append_array([northArrow,eastArrow,southArrow,westArrow])
	for i in range (0,4):
		arrowList[i].rotation = deg_to_rad(0 + 90*i)
		arrowList[i].arrow_clicked.connect(_on_arrow_clicked)

# Sets the position of the ArrowManager equal to the Player position
func syncPosition() -> void:
	self.position = $"../Player".position

# Updates visibility of the arrows whether or not the player can move in that direction
func updateArrowVisibility() -> void:
	northArrow.visible = $"../Player".checkFreeTile("north")
	eastArrow.visible = $"../Player".checkFreeTile("east")
	southArrow.visible = $"../Player".checkFreeTile("south")
	westArrow.visible = $"../Player".checkFreeTile("west")

# When an arrow is clicked, move the player in that direction
func _on_arrow_clicked(arrow: Sprite2D) -> void:
	if(arrow == northArrow):
		$"../Player".slideDirection("north")
	if(arrow == eastArrow):
		$"../Player".slideDirection("east")
	if(arrow == southArrow):
		$"../Player".slideDirection("south")
	if(arrow == westArrow):
		$"../Player".slideDirection("west")

func _process(delta: float) -> void:
	syncPosition()
	updateArrowVisibility()
	pass
