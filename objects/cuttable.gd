class_name Cuttable extends Thing
var shaderMat: ShaderMaterial
@export var cut_plane:Node3D
@export var tool_shader_disabled: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("cuttable")
	position = Vector3(roundi(position.x), roundi(position.y), roundi(position.z))

	
	var texture:Texture2D = _retrieve_texture()
	
	
	shaderMat = _mesh().material_override
	if Engine.is_editor_hint():
		shaderMat.set_shader_parameter("disabled", tool_shader_disabled)
	else:
		shaderMat.set_shader_parameter("disabled", false)
	#else:	
		#if shaderMat == null:
			#shaderMat = ShaderMaterial.new()
			#shaderMat.shader = load
	shaderMat.set_shader_parameter("_albedo", texture)
		

	
func _mesh() -> MeshInstance3D:
	print("cuttable._mesh: Should not call")
	return null	

func _retrieve_texture() -> Texture2D:
	print("cuttable._retrieve_texture: Should not call")
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cut_plane:
		shaderMat.set_shader_parameter("cutplane", cut_plane.transform)
		




