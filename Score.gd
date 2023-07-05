extends Label

@onready var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str(score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.text = str(score)
	pass

