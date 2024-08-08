## wand.gd
# simple magic wand tool
# - add StaticBody2d

extends Node2D


@export var water_scene: PackedScene

var target_body : StaticBody2D 
signal hit

var target : Vector2

var wand_collide : bool = false

func _ready():
	$objectDetectSprite.visible = false
	wand_collide = false
	pass # Replace with function body.


func use():
	if (wand_collide == false):
		if $charge_timer.is_stopped():
			var new_thing = load("res://things/water.tscn").instantiate()
			new_thing.position = get_node("..").position + target
			get_node("../../world").add_child(new_thing)
			$charge_timer.start()
	else:
		if $charge_timer.is_stopped():
			target_body.queue_free()
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


func _on_area_2d_body_entered(body):
	if body is StaticBody2D:
		target_body = body
	
	$objectDetectSprite.visible = true
	wand_collide = true



func _on_area_2d_body_exited(_body):
	$objectDetectSprite.visible = false
	wand_collide = false
