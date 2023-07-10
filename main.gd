extends Node2D

@onready var my_list = $ItemList


# Called when the node enters the scene tree for the first time.
func _ready():
	
#	my_list.add_item("bar")
#	my_list.add_item("blip")
	
	
#	var root = my_tree.create_item()
#	tree.hide_root = true
	
#	root.set_text(0,"foo")
	
#	var child1 = tree.create_item(root)
#	var _child2 = tree.create_item(root)
#	var subchild1 = tree.create_item(child1)
#	subchild1.set_text(0, "Subchild1")

	dir_contents(".")


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
			else:
				print("Found file: " + file_name)
				if ".tscn" in file_name:
					my_list.add_item(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


func _on_item_list_item_clicked(index, _at_position, _mouse_button_index):
	var list_item_text = my_list.get_item_text(index)
#	print("list index " + str(index) + " " + foo)
	
	var file_path = "res://" + list_item_text
	get_tree().change_scene_to_file(file_path)
	
	pass # Replace with function body.
