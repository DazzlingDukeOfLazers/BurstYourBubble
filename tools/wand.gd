extends Node2D

@export var water_scene: PackedScene


signal hit

var target : Vector2

func _ready():
	$objectDetectSprite.visible = false
	pass # Replace with function body.


func use():
	
	if $charge_timer.is_stopped():
		var new_thing = load("res://things/water.tscn").instantiate()
		new_thing.position = get_node("..").position + target
		get_node("../../world").add_child(new_thing)
		$charge_timer.start()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("move_right"):
		target = Vector2(96,0)
		position = target
	if Input.is_action_pressed("move_left"):
		target = Vector2(-96,0)
		position = target
	if Input.is_action_pressed("move_down"):
		target = Vector2(0,96)
		position = target
	if Input.is_action_pressed("move_up"):
		target = Vector2(0,-96)
		position = target
	if Input.is_key_pressed(KEY_SPACE):
		use()
		pass
		

	
func start(pos):
	self.position = pos.position
	$CollisionShape2D.set_deferred(&"disabled", false)



func _on_area_2d_area_entered(area):
	$objectDetectSprite.visibile = true
	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	$objectDetectSprite.visible = false
	pass # Replace with function body.





func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$objectDetectSprite.visibile = true
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	$objectDetectSprite.visible = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	$objectDetectSprite.visible = false
	pass # Replace with function body.
