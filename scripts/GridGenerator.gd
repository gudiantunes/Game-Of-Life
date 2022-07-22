extends Node2D
class_name Grid2D

export var startPosition:Vector2
export var colums:int

var screenSize:Vector2
var cellSize:float
var rows:int

var gridObjs:Array
var grid:Array

const cellScene = preload("res://CellQuad.tscn")

func getCellSize():
	screenSize = get_viewport_rect().size
	cellSize = screenSize.x/colums
	rows = screenSize.y/cellSize

func generateGrid():
	getCellSize()
	var startPos = Vector2(cellSize/2, cellSize/2)
#	var col = []
	for i in colums:
		var row = []
		for j in rows:
			var temp = cellScene.instance()
			var tempPos = startPos + Vector2(cellSize*i, cellSize*j)
			temp.mesh.size = Vector2(cellSize-1, cellSize-1)
			temp.get_node('Area2D').get_node('CollisionShape2D').shape.extents = Vector2(cellSize/2, cellSize/2)
			var temp_rand = randf()
			if temp_rand <= 0.1:
				temp.isAlive=true
			temp.position = tempPos
			add_child(temp)
			temp.cellInd = Vector2(i,j)
			gridObjs.append(temp)
			row.append(temp)
		grid.append(row)
