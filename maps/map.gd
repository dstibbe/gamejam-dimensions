@tool
class_name GameMap extends Node3D

signal exiting

var player:Player

var height = 8
var length = 17
var width = 5
var positions:Array[Vector3]
var cut_plane:Node3D 
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Map READY")
	cut_plane = Node3D.new()
	add_child(cut_plane)
	cut_plane.position = Vector3(0,0,0)
	cut_plane.rotate_object_local(Vector3(1.,0.,0.), deg_to_rad(-90)) 
	
	create_map()
	
	print(cut_plane.transform)
	
	if !Engine.is_editor_hint():
		for exit_node in get_tree().get_nodes_in_group("exit"):
			exit_node.triggered.connect(exit)
			
		var scaling = Vector3(1.,1.,0.7)
		for cuttable in get_tree().get_nodes_in_group("cuttable"):
			cuttable.cut_plane = cut_plane
			var c:Node3D = cuttable
			if !Engine.is_editor_hint():
				#var t:Transform3D = cuttable.transform
				c.scale = scaling
				#cuttable.transform = t.scaled(scaling)
				#print(cuttable.transform)
	
	spawn_player()
	

func spawn_player():
	print("Spawn Player")
	player.move_to_position( $start.position )
	change_block_visibility(player.position.z)

func create_map():
	var count:Array = []
	
	for child in get_children():
		if child is Floor:
			child.set_floor_size(length)
		if child is FBWall:
			child.set_wall_size(length, height)
		if child is LRWall:
			child.set_wall_size(height, width)
	player.set_zs(-2, 2)
	player.set_xs(-8, 8)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_block_visibility(z:int):
	print("Updating block visibility")
	var plane_z = z+0.5
	print("incoming z: ", z)
	print("plane z: ", plane_z)
	cut_plane.position.z = plane_z
			
func exit():
	print("Exiting map")
	exiting.emit()				
