extends Node2D

	
func set_player(player:CharacterBody2D):
	print(self, ", player,", player)
	$title_menu_a.foo()
	$title_menu_a.set_player(player)
	player.position = Vector2(400,400)
#	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
