extends Node2D

	
func set_player(player:CharacterBody2D):
	print(self, ", player,", player)
#	$title_menu_a.foo()
	$title_menu_a.set_player(player)
	player.position = Vector2(1600,800)
	
func set_player_pos(player:CharacterBody2D, pos:Vector2):
	$title_menu_a.set_player_pos(player, pos)
#	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
