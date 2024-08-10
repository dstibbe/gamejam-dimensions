class_name Splash extends CanvasLayer

var pressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Window.NOTIFICATION_WM_SIZE_CHANGED:
		#print("window_size: ", get_window().size)
		#change_size(get_window().size)
		#$Dimensions.position = Vector2(get_window().size.x / 2, get_window().size.y / 2)
	#1152, 648
		var sizing:float = get_window().size.x / 1152.0
		#print("sizing: ", sizing)
		scale = Vector2(sizing, sizing)
	#get_window().size
	
	
	
	if Input.is_anything_pressed():
		if pressed == true:
			queue_free()

func _input(event):
	if event.is_action_pressed("f11"):
		pressed = false
	if !event.is_action_pressed("f11"):
		#print("true")
		pressed = true
#func change_size(windowsize):
	#$Dimensions.position = Vector2(windowsize.x / 2, windowsize.y / 2)
	##1152, 648
	#var sizing:float = windowsize.x / 1152
	#print("sizing: ", sizing)
	#scale = Vector2(sizing, sizing)
#func _input(event):
	#if event.is_action_pressed():
		#queue_free()
