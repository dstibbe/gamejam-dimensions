class_name Player extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var side = 1
var minz = 0
var maxz = 0
var minx = 0
var maxx = 0
var collision_plus: int = 0
var collision_min: int = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var door = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "`", "`")
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED * side
		if position.x > maxx or position.x < minx:
			position.x = roundi(position.x)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	if Input.is_action_just_released("up"):
		if position.z > minz:
			
			if door == -1:
				get_parent().end_level()
			elif collision_min == 0:
				position.z = roundi(position.z - side * 1)
				get_parent()._player_z_pos_changed(1, position.z)
			
	if Input.is_action_just_pressed("down"):
		if position.z < maxz:
			if door == 1:
				get_parent().end_level()
			elif collision_plus == 0:
				position.z = roundi(position.z +  side * 1)
				get_parent()._player_z_pos_changed(1, position.z) #1 is side,in case you want to turn around
	move_and_slide()

func set_zs(min_z, max_z):
	minz = min_z
	maxz = max_z
	
func set_xs(min_x, max_x):
	minx = min_x
	maxx = max_x

func move_to_z_not_possible(posz):
	if posz < position.z:
		collision_min+=1
	if posz > position.z:
		collision_plus+=1

func move_to_z_possible(posz):
	if posz < position.z:
		collision_min -=1
	if posz > position.z:
		collision_plus -=1

func infront_of_door(z:float):
	if z < position.z:
		door = -1
	if z > position.z:
		door = 1
		

func not_infront_of_door(z:float):
	door = 0		
