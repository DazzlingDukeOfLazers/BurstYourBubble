extends VBoxContainer




@onready var svg_vbox = self

@onready var row = load("res://svg_row_view.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	dir_contents("./svg")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func dir_contents(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
				dir_contents(file_name)
			else:
				print("Found file: " + file_name)
				if "import" in file_name:
					pass
				elif ".svg" in file_name:
					var hbox_foo = HBoxContainer.new()
#					var row = load("res://svg_row_view.tscn")
					var this_row = row.instantiate()
					this_row.find_child("filename").text = file_name
					print("baz, " + dir.get_current_dir() + "/" + file_name)
					var image = Image.load_from_file(dir.get_current_dir() + "/" + file_name)
					var texture = ImageTexture.create_from_image(image)
					this_row.find_child("thumbnail").texture = texture
					hbox_foo.add_child(this_row)
					svg_vbox.add_child(hbox_foo)
					


			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
