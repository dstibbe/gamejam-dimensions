class_name Game extends Node3D

@export var map_scene:PackedScene
var current_map:GameMap

# Called when the node enters the scene tree for the first time.
func _ready():
	current_map = map_scene.instantiate()
	add_child(current_map)
	current_map.player=$player
	current_map.create_map(0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _player_z_pos_changed(side, z): #side == 1 -> + z == backwards
	#change_blocks(side, z)
	current_map.change_blocks(side, z)
	$Camera3D.position.z = 10 + z

func change_blocks(side, z):
	current_map.change_blocks(side, z)
