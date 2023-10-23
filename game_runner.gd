extends Node2D

func _ready():	
	$title_screen.set_player($Player)
	
	$title_screen.set_player_pos($Player, Vector2(800, 800))


func _process(delta):
	pass
