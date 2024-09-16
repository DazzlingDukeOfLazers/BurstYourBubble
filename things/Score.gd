extends Label

@onready var value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str(value)
	pass # Replace with function body.


func set_value( new_value):
	value = new_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.text = str(value)
	pass

