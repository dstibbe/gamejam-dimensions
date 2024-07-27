@tool
class_name LRWall extends Thing

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_wall_size(size_y, size_z):
	for child in get_children():
		if child is CollisionShape3D:
			child.basis.y.y = size_y
			child.basis.z.z = size_z
			child.position.y = size_y / 2 + .5
		if child is MeshInstance3D:
			child.basis.y.y = size_y
			child.basis.z.z = size_z
			child.position.y = size_y / 2 + .5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
