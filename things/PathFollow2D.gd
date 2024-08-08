extends PathFollow2D


var speed = 0.05


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += delta * speed
	pass
