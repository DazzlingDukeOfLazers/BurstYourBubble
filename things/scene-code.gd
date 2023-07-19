extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	var this_scene = get_tree().current_scene
	text = this_scene.scene_file_path
	
	var file = FileAccess.open(this_scene.scene_file_path, FileAccess.READ)
	text = file.get_as_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	self.visible = !self.visible
	pass # Replace with function body.
