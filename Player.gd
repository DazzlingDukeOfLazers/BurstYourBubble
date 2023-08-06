extends CharacterBody2D

signal hit

var coin_count:int = 0

@export var speed = 400 # pixels / sec
@onready var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.

func _process(_delta):
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
		
	move_and_slide()
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = -velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "walk" # TBD, replace with better "up" animation
		$AnimatedSprite2D.flip_v = velocity.y > 0


	
func start(pos):
	self.position = pos.position
	show()
	$CollisionShape2D.set_deferred(&"disabled", false)

func _on_body_entered(_body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred(&"disabled", true)



func _on_pickup_area_2d_area_entered(area):
	if area.name.begins_with("coin"):
		coin_count += 1
		area.queue_free()
