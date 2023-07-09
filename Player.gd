extends CharacterBody2D

signal hit

@export var speed = 400 # pixels / sec
@onready var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 100
	if Input.is_action_pressed("move_left"):
		velocity.x -= 100
	if Input.is_action_pressed("move_down"):
		velocity.y += 100
	if Input.is_action_pressed("move_up"):
		velocity.y -= 100

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
#	position += velocity * delta
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
	move_and_slide()
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite2D.flip_h = -velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "walk" # TBD, replace with better "up" animation
		$AnimatedSprite2D.flip_v = velocity.y > 0


	
func start(pos):
	self.position = pos.position
	show()
	$CollisionShape2D.set_deferred(&"disabled", false)


#func _on_Player_body_entered(_body):
#	hide()
##	self.visible = false # Player disappears after being hit.
#	hit.emit()
#	# Must be deferred as we can't change physics properties on a physics callback.
#	$CollisionShape2D.set_deferred(&"disabled", true)




func _on_body_entered(_body):
	
	
	if true:
#	if get_colliding_bodies.is_in_group("mobs"):
		
		hide()
	#	self.visible = false # Player disappears after being hit.
		hit.emit()
		# Must be deferred as we can't change physics properties on a physics callback.
		$CollisionShape2D.set_deferred(&"disabled", true)

