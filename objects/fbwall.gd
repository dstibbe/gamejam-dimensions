@tool
class_name FBWall extends Thing


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_wall_size(size_x, size_y):
	for child in get_children():
		if child is CollisionShape3D:
			child.basis.x.x = size_x
			child.basis.y.y = size_y
			child.position.y = size_y / 2
		if child is MeshInstance3D:
			child.basis.x.x = size_x
			child.basis.y.y = size_y
			child.position.y = size_y / 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
