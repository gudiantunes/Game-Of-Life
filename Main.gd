extends "res://scripts/GridGenerator.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	generateGrid()

func updateGrid():
	for i in gridObjs:
		i.updateCell(grid)
	
func _on_Timer_timeout():
	updateGrid()
