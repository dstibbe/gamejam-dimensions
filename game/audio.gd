extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func level_clear():
	stop()
	stream = null
	stop()
	stream = load("res://assets/Retro Event Acute 08.wav")
	play(0)

func change_dimensions():
	stop()
	stream = null
	stop()
	stream = load("res://assets/Retro Event UI 01.wav")
	play(0)

func jump():
	stop()
	stream = null
	stop()
	stream = load("res://assets/jump.wav")
	play(0)
