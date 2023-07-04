extends Node

# Reference to your SVG file
var svg_path = "res://svg/bird.svg"

# Scales to apply
var scales = [0.5, 1, 1.5, 2]

# Colors to apply
var colors = [Color.RED, Color.BLUE, Color.GREEN, Color.YELLOW]

# Rotation rates to apply
var rotation_rate = [1, 1, 2, 1]

# Starting positions to apply
var starting_positions = [Vector2(50, 50), Vector2(150, 150), Vector2(250, 250), Vector2(350, 350)]

# Store the created Sprite2Ds and their associated Tweens
var sprites = []

# Duration of the transition
var transition_duration = 1.0

# Store the currently dragged Sprite2D
var dragged_sprite = null

# Create a Tween
#@onready var tween = get_tree().create_tween()
var rotation_multiplier = 2.0

func _ready():
	
	for i in range(scales.size()):
		# Create a new Sprite2D
		var sprite = Sprite2D.new()

		# Load SVG as StreamTexture
		var svg_texture = load(svg_path)

		# Assign the texture to Sprite2D
		sprite.texture = svg_texture

		# Apply scale
		sprite.scale = Vector2(scales[i], scales[i])

		# Apply color
		sprite.modulate = colors[i]

		# Set the pivot_offset to the center of the Sprite2D
		sprite.centered = true

		# Add the Sprite2D as a child of the current node
		add_child(sprite)

		# Position the Sprite2D based on the starting_positions array
		sprite.position = starting_positions[i]

		# Add the Sprite2D to the array
		sprites.append(sprite)

func _process(delta):
	for i in range(sprites.size()):
		sprites[i].rotation += rotation_rate[i] * delta * rotation_multiplier


func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			for sprite in sprites:
				if sprite.get_rect().has_point(sprite.to_local(event.position)):
					dragged_sprite = sprite
					# Start the scale animation
					var tween = create_tween()
					var sizes = [0.4, 1.6, 1.0]
					var timings = [0.1, 0.1, 0.1]
					for size in sizes:
						var size_vec = size * sprite.scale
						tween.tween_property(sprite, "scale", size_vec, timings.pop_at(0))
					return
		else:
			dragged_sprite = null
	elif event is InputEventMouseMotion and dragged_sprite:
		dragged_sprite.position += event.relative
	
	


func _on_texture_button_button_down():
	rotation_multiplier = 8.0

func _on_texture_button_button_up():
	rotation_multiplier = 1.0
