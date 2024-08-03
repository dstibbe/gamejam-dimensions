class_name CongratScreen extends CanvasLayer
var finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if finished:
		if Input.is_anything_pressed():
			get_tree().quit()

func finish():
	finished = true
	visible = true
