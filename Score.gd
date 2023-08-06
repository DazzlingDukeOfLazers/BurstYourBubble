extends Label

@onready var value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str(value)
	pass # Replace with function body.


func _set(property, value):
	property = value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.text = str(value)
	pass

