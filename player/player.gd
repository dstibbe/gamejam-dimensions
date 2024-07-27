class_name Player extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var side = 1
var minz = 0
var maxz = 0
var minx = 0
var maxx = 0
var possible_plus = true
var possible_min = true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


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
			if possible_min:
				position.z = roundi(position.z - side * 1)
				get_parent()._player_z_pos_changed(1, position.z)
	if Input.is_action_just_pressed("down"):
		if position.z < maxz:
			if possible_plus:
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
		possible_min = false
	if posz > position.z:
		possible_plus = false

func move_to_z_possible(posz):
	if posz < position.z:
		possible_min = true
	if posz > position.z:
		possible_plus = true
