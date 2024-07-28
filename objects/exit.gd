@tool
class_name Exit extends Thing

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector3(roundi(position.x), roundi(position.y), roundi(position.z))
	
	if !Engine.is_editor_hint():
		var material = ResourceLoader.load("res://resources/bloack_shader_material.tres", "ShaderMaterial")
		$MeshInstance3D.material_override = null
		print($MeshInstance3D.material_override )
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _in_front_of_exit(body):
	if body is Player:
		print("next to door")
		body.infront_of_door(position.z)
	
func _away_from_of_exit(body):
	if body is Player:
		print("away  from door")
		body.not_infront_of_door(position.z)



