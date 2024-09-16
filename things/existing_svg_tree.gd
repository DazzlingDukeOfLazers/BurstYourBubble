extends Tree


@onready var existing_svg_tree = self
@onready var existing_svg_root = existing_svg_tree.create_item()


# Called when the node enters the scene tree for the first time.
func _ready():
	existing_svg_root.set_text(0, "Existing SVGs")
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
				if ".svg" in file_name:
					var child_node = existing_svg_root.create_child()
					child_node.set_text(0, path + "/" + file_name)
					


			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
