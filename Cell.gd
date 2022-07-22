extends MeshInstance2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var isAlive = false
var cellInd:Vector2

func _ready():
	modulate = Color(0,0,0)
	if isAlive:
		modulate = Color(1,1,1)

func revive():
	if not isAlive:
		isAlive = true
		modulate = Color(1,1,1)
	
func updateCell(grid):
	var nb = 0
#	if isAlive:
	for x in range(-1, 2):
		for y in range(-1, 2):
			if cellInd.x+x < grid.size() and cellInd.y+y < grid[0].size():
				var temp = grid[cellInd.x+x][cellInd.y+y]
				if temp.isAlive and temp != self:
					nb += 1
	if not isAlive:
		if nb == 3:
			isAlive = true
			modulate = Color(1,1,1)
	else:
		print(nb)
		if nb < 2 or nb > 3:
			isAlive = false
			modulate = Color(0,0,0)
			
func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed):
		revive()
