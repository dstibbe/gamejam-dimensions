class_name Cuttable extends Thing
@onready var shaderMat: ShaderMaterial = $mesh.material_override
@export var cut_plane:Node3D 

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("cuttable")
	
	position = Vector3(roundi(position.x), roundi(position.y), roundi(position.z))
	


	var texture:Texture2D = _retrieve_texture()
	shaderMat.set_shader_parameter("_albedo", texture)
	
func _retrieve_texture() -> Texture2D:
	print("Should not call")
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cut_plane:
		shaderMat.set_shader_parameter("cutplane", cut_plane.transform)
		




