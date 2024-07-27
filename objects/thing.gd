@tool
class_name Thing extends StaticBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func be_visible():
	print("block_visible")
	for child in get_children():
		if child is MeshInstance3D:
			child.visible = true
			child.set_instance_shader_parameter("visible", true)
			child.set_instance_shader_parameter("fading", false)
			child.set_instance_shader_parameter("barely_visible", false)
			child.set_instance_shader_parameter("invisible", false)

func fading():
	print("block_fading")
	for child in get_children():
		if child is MeshInstance3D:
			child.visible = true
			child.set_instance_shader_parameter("visible", false)
			child.set_instance_shader_parameter("fading", true)
			child.set_instance_shader_parameter("barely_visible", false)
			child.set_instance_shader_parameter("invisible", false)

func barely_visible():
	print("block_barely_visible")
	for child in get_children():
		if child is MeshInstance3D:
			child.visible = true
			child.set_instance_shader_parameter("visible", false)
			child.set_instance_shader_parameter("fading", false)
			child.set_instance_shader_parameter("barely_visible", true)
			child.set_instance_shader_parameter("invisible", false)

func invisble():
	print("block_invisible")
	for child in get_children():
		if child is MeshInstance3D:
			child.visible = false
			child.set_instance_shader_parameter("visible", false)
			child.set_instance_shader_parameter("fading", false)
			child.set_instance_shader_parameter("barely_visible", false)
			child.set_instance_shader_parameter("invisible", true)


func _on_body_entered(body):
	if body is Player:
		body.move_to_z_not_possible(position.z)
	
func _on_body_exited(body):
	if body is Player:
		body.move_to_z_possible(position.z)
