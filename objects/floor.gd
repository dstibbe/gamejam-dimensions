@tool
class_name Floor extends Thing

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_floor_size(size_x):
	for child in get_children():
		if child is CollisionShape3D:
			child.basis.x.x = size_x
		if child is MeshInstance3D:
			child.basis.x.x = size_x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
