extends Node2D

# xPosition and yPosition represent the position of the player on the chessboard
# 0,0 is located at the bottom left of the chessboard
@export var xPosition: int = 0
@export var yPosition: int = 0

# Called every frame.
func _process(delta: float) -> void:
	self.position.x = translateX(xPosition)
	self.position.y = translateY(yPosition)
	
func translateX(xPos:int) -> int:
	return 280 + (112 * xPos)
func translateY(yPos:int) -> int:
	return 1064 - (112 * yPos)

# Checks if the Player can move in a certain direction.
# A direction can be one of "north", "south", "east" or "west".
func checkFreeTile(direction: String) -> bool:
	if (yPosition == 8):
		return false
	match direction:
		"north":
			if yPosition == 7:
				if xPosition == 6:
					return true # north is the position of the goal
				return false
			if $"../WallManager".checkBarrier(yPosition+7,xPosition):
				return false
			return true
		"east":
			if xPosition >= 7:
				return false
			if yPosition < 0:
				return false
			if $"../WallManager".checkBarrier(xPosition,yPosition):
				return false
			return true
		"south":
			if yPosition <= 0:
				return false
			if $"../WallManager".checkBarrier(yPosition+6,xPosition):
				return false
			return true
		"west":
			if xPosition <= 0:
				return false
			if yPosition < 0:
				return false
			if $"../WallManager".checkBarrier(xPosition-1,yPosition):
				return false
			return true
		_:
			print ("Invalid direction")
			return false

# Moves the Player into a direction
# A direction can be one of "north", "south", "east" or "west".
func moveDirection(direction: String) -> void:
	match direction:
		"north":
			yPosition += 1
		"east":
			xPosition += 1
		"south":
			yPosition -= 1
		"west":
			xPosition -= 1
		_:
			print(direction + " is an invalid direction")
			
# Checks if the player has reached the goal
func checkVictoryCondition(x: int, y :int) -> void:
	if (x == 6 && y == 8):
		$"../VictoryUI".visible = true
func playCollisionSound() -> void:
	$CollideSfx.play()
# Function to move the player in the actual game.
func slideDirection(direction: String) -> void:
	while checkFreeTile(direction):
		moveDirection(direction)
	playCollisionSound()
	checkVictoryCondition(xPosition,yPosition)
