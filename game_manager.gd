extends Node2D

@export var levelBlueprint = [
	[true, false, false], 
	[true, false, false], 
	[true, false, false]
]

var tileScene : PackedScene = preload("res://tile.tscn")
var boardState = []

@export var tileSpacing : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	renderBoard(levelBlueprint.size())
	pass # Replace with function body.

func renderBoard(size:int):
	for row in range(0, size):
		boardState.append([])
		for col in range(0, size):
			var instance : Node2D = tileScene.instantiate()
			InitializeTile(instance, row, col)
			boardState[row].append(instance)
			$Board.add_child(instance)

func InitializeTile(instance: Node2D, row: int, col: int):
	instance.connect("tileSwap", onTileSwap)
	instance.xPosition = row
	instance.yPosition = col
	instance.position = Vector2(
		$Board.global_position.x + tileSpacing * col, 
		$Board.global_position.y + tileSpacing * row
	)
	instance.isFlipped = levelBlueprint[row][col]
	instance.init()

## Signal connection functions

func onTileSwap(xPosition: int, yPosition : int) :
	for row in range(yPosition - 1, yPosition + 2) :
		if row >= 0 and row < boardState.size() :
			for col in range(xPosition - 1, xPosition + 2) :
				if col >= 0 and col < boardState.size() :
					boardState[col][row].flipTile()
	
	
