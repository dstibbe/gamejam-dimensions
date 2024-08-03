@tool
class_name Thing extends StaticBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("blocks")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func be_visible():
	for child in get_children():
		if child is MeshInstance3D:
			child.visible = true
			child.set_instance_shader_parameter("visible", true)
			child.set_instance_shader_parameter("fading", false)
			child.set_instance_shader_parameter("barely_visible", false)
			child.set_instance_shader_parameter("invisible", false)

func fading():
	for child in get_children():
		if child is MeshInstance3D:
			child.visible = true
			child.set_instance_shader_parameter("visible", false)
			child.set_instance_shader_parameter("fading", true)
			child.set_instance_shader_parameter("barely_visible", false)
			child.set_instance_shader_parameter("invisible", false)

func barely_visible():
	for child in get_children():
		if child is MeshInstance3D:
			child.visible = true
			child.set_instance_shader_parameter("visible", false)
			child.set_instance_shader_parameter("fading", false)
			child.set_instance_shader_parameter("barely_visible", true)
			child.set_instance_shader_parameter("invisible", false)

func invisble():
	pass
