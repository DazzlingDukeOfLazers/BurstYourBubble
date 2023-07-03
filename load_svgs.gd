extends Node

# Reference to your SVG file
var svg_path = "res://svg/bird.svg"

# Scales to apply
var scales = [0.5, 1, 1.5, 2]

# Colors to apply
var colors = [Color.ORANGE_RED, Color.CORNFLOWER_BLUE, Color.FOREST_GREEN, Color.YELLOW]

# Rotation rates to apply
var rotation_rate = [1, 1, 2, 1]

# Store the created Sprites
var sprites = []

func _ready():
	for i in range(scales.size()):
		# Create a new Sprite
		var sprite = Sprite2D.new()

		# Load SVG as StreamTexture
		var svg_texture = load(svg_path)

		# Assign the texture to Sprite
		sprite.texture = svg_texture

		# Apply scale
		sprite.scale = Vector2(scales[i], scales[i])

		# Apply color
		sprite.modulate = colors[i]

		# Set the pivot_offset to the center of the Sprite
		sprite.centered = true

		# Add the Sprite as a child of the current node
		add_child(sprite)

		# Position the Sprite so they don't overlap
		sprite.position = Vector2(i * svg_texture.get_width() * scales[i], 0)

		# Add the Sprite to the array
		sprites.append(sprite)

func _process(delta):
	for i in range(sprites.size()):
		sprites[i].rotation += rotation_rate[i] * delta
