extends Area2D

signal tileSwap(x, y)

# Variables
var xPosition : int
var yPosition : int
var isFlipped : bool = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click") :
		tileSwap.emit(xPosition, yPosition)
		

func flipTile() :
	isFlipped = not isFlipped
	$head_sprite.visible = not isFlipped
	$"tail-sprite".visible = isFlipped
	
func init() :
	$head_sprite.visible = not isFlipped
	$"tail-sprite".visible = isFlipped
