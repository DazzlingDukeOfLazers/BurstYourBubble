extends Node2D

signal hit

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_right"):
		position = get_node("../Player").position
		position.x += 64
	if Input.is_action_pressed("move_left"):
		position = get_node("../Player").position
		position.x -= 64
	if Input.is_action_pressed("move_down"):
		position = get_node("../Player").position
		position.y += 64
	if Input.is_action_pressed("move_up"):
		position = get_node("../Player").position
		position.y -= 64

	
func start(pos):
	self.position = pos.position
	$CollisionShape2D.set_deferred(&"disabled", false)

