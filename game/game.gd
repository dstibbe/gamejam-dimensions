class_name Game extends Node3D

@export var maps:Array[PackedScene]
var current_level:int = 0
var current_map:GameMap
@onready var nr_levels = maps.size()


# Called when the node enters the scene tree for the first time.
func _ready():
	assert(maps.size() > 0, "No maps configured")
	
	start_level(0)
	
func start_level(lvl:int):
	assert(0 <= lvl && lvl < nr_levels, str("Invalid level: ", lvl))
	current_level = lvl
	current_map = maps[current_level].instantiate()
	add_child(current_map)
	current_map.player=$player
	current_map.create_map(0)
	current_map.spawn_player()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _player_z_pos_changed(side, z): #side == 1 -> + z == backwards
	#change_blocks(side, z)
	current_map.change_blocks(side, z)
	$Camera3D.position.z = 10 + z

func change_blocks(side, z):
	current_map.change_blocks(side, z)


func end_level():
	var new_level = current_level + 1
	if new_level == nr_levels:
		print("Finished!")
		get_tree().quit()
	else:	
		var old_map = current_map
		start_level(new_level)	
		old_map.queue_free()
