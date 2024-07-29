extends Node3D

@export var player:Player

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(player != null, "Need to attach player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_dir = Input.get_vector("left", "right", "`", "`")
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	
	if direction.x < 0:
		player.left()
	elif direction.x > 0:
		player.right()
		
func _input(event):
	if event.is_action_released("jump"):
		print(Time.get_unix_time_from_system(), " jump")
		player.jump()
	
	if event.is_action_released("up"):
		player.up()
	elif event.is_action_released("down"):
		player.down()
	
	
