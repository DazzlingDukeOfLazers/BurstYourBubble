extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_left_body_entered(body):
	if body == get_node("../Player"):
		get_tree().change_scene_to_file("res://main.tscn")


func _on_right_body_entered(body):
	if body == get_node("../Player"):
		get_tree().change_scene_to_file("res://things/map_rnd.tscn")


func _on_bottom_body_entered(body):
	if body == get_node("../Player"):
		get_tree().reload_current_scene()


func _on_top_body_entered(body):
	if body == get_node("../Player"):
		get_tree().reload_current_scene()
