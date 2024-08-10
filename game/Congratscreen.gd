class_name CongratScreen extends CanvasLayer
var finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Window.NOTIFICATION_WM_SIZE_CHANGED:
		#print("window_size: ", get_window().size)
		#change_size(get_window().size)
		#$Dimensioncongrats.position = Vector2(get_window().size.x / 2, get_window().size.y / 2)
	#1152, 648
		var sizing:float = get_window().size.x / 1152.0
		#print("sizing: ", sizing)
		scale = Vector2(sizing, sizing)
		
	if finished:
		if Input.is_anything_pressed():
			get_tree().quit()

func finish():
	finished = true
	visible = true
