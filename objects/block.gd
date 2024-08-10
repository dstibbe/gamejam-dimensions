@tool
class_name Block extends Cuttable



func _mesh() -> MeshInstance3D:
	return $mesh

#func _retrieve_texture() -> Texture2D : 
	#var the_mesh: ArrayMesh = $mesh.mesh
	#var mat:StandardMaterial3D =   the_mesh.material
	#var texture:Texture2D = mat.albedo_texture
#
	#return texture


func _retrieve_texture() -> Texture2D : 
	var the_mesh: ArrayMesh = $mesh.mesh
	var mdt = MeshDataTool.new()
	mdt.create_from_surface(the_mesh,0)
	var mat:StandardMaterial3D = mdt.get_material()
	var texture:Texture2D = mat.albedo_texture
	return texture
