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

# Store the created Sprite2Ds
var sprites = []

# Store the currently dragged Sprite2D
var dragged_sprite = null

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
		sprites[i].rotation += rotation_rate[i] * delta

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			for sprite in sprites:
				if sprite.get_rect().has_point(sprite.to_local(event.position)):
					dragged_sprite = sprite
					return
		else:
			dragged_sprite = null
	elif event is InputEventMouseMotion and dragged_sprite:
		dragged_sprite.position += event.relative
