@tool
class_name Block extends Thing

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector3(roundi(position.x), roundi(position.y), roundi(position.z))
	
	if Engine.is_editor_hint():
		#var material = StandardMaterial3D.new()
		var material = ResourceLoader.load("res://resources/test_texture.tres", "BaseMaterial3D")
		$MeshInstance3D.material_override = material


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



