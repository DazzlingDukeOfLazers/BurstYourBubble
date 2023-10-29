extends Node2D


@onready var player_node: CharacterBody2D 



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	player_node = get_tree().get_root().get_child(0).get_node("Player")
#	print(self, ", tree, [", get_tree(),            "]")
#	print(self, ", root, [", get_tree().get_root(), "]")
#	print(self, ", player_node, [", player_node, "]")
#	print(self, ", root.child", get_tree().get_root().get_child(0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#class title_menu extends Node2D:

func foo():
	print("foo")

func set_player(player:CharacterBody2D):
	print(self, "player, ", player)
	player.position = Vector2(800, 800)
	player_node = player

func set_player_pos(player:CharacterBody2D, pos:Vector2):
	print(self, "player, ", player)
	player.position = pos
	player_node = player

var once : bool = false
func _on_left_body_entered(body):
#	pass
	if not once:
		once = true
	else:	
		if body == player_node:
			get_tree().change_scene_to_file("res://main.tscn")


func _on_right_body_entered(body):	
	if body == player_node:
		get_tree().change_scene_to_file("res://things/map_rnd.tscn")


func _on_bottom_body_entered(body):
	if body == player_node:
		get_tree().reload_current_scene()


func _on_top_body_entered(_body):
	pass
#	if body == player_node:
#		get_tree().reload_current_scene()
