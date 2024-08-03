@tool
class_name Block extends Cuttable




func _retrieve_texture() -> Texture2D : 
	var the_mesh: BoxMesh = $mesh.mesh
	var mat:StandardMaterial3D =   the_mesh.material
	var texture:Texture2D = mat.albedo_texture

	return texture
