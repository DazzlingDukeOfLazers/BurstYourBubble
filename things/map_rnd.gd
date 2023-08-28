extends Node2D


@onready var world = $world

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func create_level_data():
	var level_dict = {
		"world" : world
	}
	return create_level_data



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
