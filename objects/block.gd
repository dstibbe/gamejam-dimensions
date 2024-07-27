@tool
class_name Block extends Thing

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector3(roundi(position.x), roundi(position.y), roundi(position.z))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




