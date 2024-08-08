extends Path2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PathFollow2D.progress_ratio += 0.001
	if ($PathFollow2D.progress_ratio > 1):
		$PathFollow2D.progress_ratio = 0
	pass
