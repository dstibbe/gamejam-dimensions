@tool
class_name GameMap extends Node3D

var player:Player

var height = 8
var length = 17
var width = 5
var positions:Array[Vector3]
# Called when the node enters the scene tree for the first time.
func _ready():
	#if Engine.is_editor_hint():
		#var count:Array = [0, 0, 0] #[floors, fbwalls, lrwalls]
		#for child in get_children():
			#if child is Floor:
				#child.set_floor_size(length)
			#if child is FBWall:
				#child.set_wall_size(length, height)
			#if child is LRWall:
				#child.set_wall_size(height, width)
				#pass
	#else:
	#create_map()
	if Engine.is_editor_hint():
		if player == null:
			player = Player.new()
		create_map(0)

func create_map(player_zpos:float):
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
	
	if !Engine.is_editor_hint():
		change_blocks(1, player_zpos)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_blocks(side:int, z:int):
	for child in get_children():
		if child is Thing:
			if side == 1:
				print("Child: ", child.position.z, " player: ", z)
				if child.position.z == z:
					child.be_visible()
				elif child.position.z == z - 1:
					child.fading()
				elif child.position.z == z - 2:
					child.barely_visible()
				elif child.position.z > z or child.position.z <= z - 0.3:
					child.invisble()
			
			
