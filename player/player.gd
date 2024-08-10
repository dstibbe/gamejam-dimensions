class_name Player extends CharacterBody3D

enum DIRECTION {NONE, UP,DOWN,LEFT,RIGHT}
enum ACTION {NONE, JUMP}

signal new_z_pos(z:float)

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
var looking_at = 1


var direction: DIRECTION = DIRECTION.NONE
var action: ACTION = ACTION.NONE

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	if action == ACTION.JUMP and is_on_floor():
		Audio.jump()
		print(Time.get_unix_time_from_system(), " jumping")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	if direction== DIRECTION.LEFT:
		turn(-1)
		velocity.x = -1 * SPEED
		if position.x > maxx or position.x < minx:
			position.x = roundi(position.x)
	elif direction== DIRECTION.RIGHT:
		turn(1)
		velocity.x = SPEED
		if position.x > maxx or position.x < minx:
			position.x = roundi(position.x)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	if direction== DIRECTION.UP:
		if position.z > minz:
			
			if $back.has_overlapping_bodies():
				for body in $back.get_overlapping_bodies():
					print("Front: ", body)
					if body is Exit:
						body.trigger()
						break
			else:
				move_z(1)
			
	if direction== DIRECTION.DOWN:
		if position.z < maxz:
			if $front.has_overlapping_bodies():
				for body in $front.get_overlapping_bodies():
					print("Back: ", body)
					if body is Exit:
						body.trigger()
						break
			else:
				move_z(-1)
	move_and_slide()
	direction= DIRECTION.NONE
	action = ACTION.NONE
	
func up():
	direction= DIRECTION.UP
func down():
	direction= DIRECTION.DOWN
func left():
	direction= DIRECTION.LEFT
func right():
	direction= DIRECTION.RIGHT
func jump():	
	action = ACTION.JUMP

func turn(side):
	if looking_at != side:
		looking_at = side
		$CollisionShape3D2.rotate_y(PI)

func set_zs(min_z, max_z):
	minz = min_z
	maxz = max_z
	
func set_xs(min_x, max_x):
	minx = min_x
	maxx = max_x

func move_to_position(new_position: Vector3) -> void:
	position = new_position
	move_z(0)

func move_z(delta_z: int) -> void:
	position.z = roundi(position.z - side * delta_z)
	var mat:ShaderMaterial = $MeshInstance3D.mesh.material
	print("Setting shader 'z': ", roundi(position.z))
	mat.set_shader_parameter("z", roundi(position.z))
	if delta_z!=0 :
		new_z_pos.emit(position.z)
