extends Node2D

@export var mob_scene: PackedScene

var spawn_count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	print("timeout")
	var mob = mob_scene.instantiate()
	# recursive
	
	$SpawnPool.add_child(mob)
	
