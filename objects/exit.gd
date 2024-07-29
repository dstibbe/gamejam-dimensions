@tool
class_name Exit extends Thing

signal triggered

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("exit")
	position = Vector3(roundi(position.x), roundi(position.y), roundi(position.z))
	
	if !Engine.is_editor_hint():
		var material = ResourceLoader.load("res://resources/door_texture.tres")
		$MeshInstance3D.material_override = material
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func trigger():
	triggered.emit()
