class_name Game extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$map1.player=$player
	$map1.create_map(0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _player_z_pos_changed(side, z): #side == 1 -> + z == backwards
	#change_blocks(side, z)
	$map1.change_blocks(side, z)
	$Camera3D.position.z = 10 + z

func change_blocks(side, z):
	$map1.change_blocks(side, z)
