extends Container

var current_progress = 0.0
var step_size = 20.0
var reset_val = 0
var meta = 0.0
var meta_step_size = 0.1


# Called when the node enters the scene tree for the first time.
func _ready():
	current_progress = reset_val
	$ProgressBar.set_value(current_progress)
	$meta_0.text = "0.0"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	current_progress += step_size
	if current_progress >= 100.0000:
		current_progress = reset_val
			
		meta += meta_step_size
		var format_string = "%0.1f" %[meta]
		$meta_0.text = str(format_string) 
		
	$ProgressBar.set_value(current_progress)
