extends Node

# Reference to your SVG file
var svg_path = "res://svg/bird.svg"

# Scales to apply
var scales = [0.5, 1, 1.5, 2]

# Colors to apply
var colors = [Color.MEDIUM_VIOLET_RED, Color.DEEP_SKY_BLUE, Color.FOREST_GREEN, Color.YELLOW_GREEN]

# Rotation rates to apply
var rotation_rate = [1, 1, 2, 1]

# Store the created TextureRects
var texture_rects = []

func _ready():
	for i in range(scales.size()):
		# Create a new TextureRect
		var texture_rect = TextureRect.new()

		# Load SVG as StreamTexture
		var svg_texture = load(svg_path)

		# Assign the texture to TextureRect
		texture_rect.texture = svg_texture

		# Apply color
		texture_rect.modulate = colors[i]

		# Apply scale
		texture_rect.scale = Vector2(scales[i], scales[i])
		

		# Add the TextureRect as a child of the current node
		add_child(texture_rect)

		# Position the TextureRect so they don't overlap
		texture_rect.position = Vector2(i * svg_texture.get_width() * scales[i], 0)
		
		# Add the TextureRect to the array
		texture_rects.append(texture_rect)

func _process(delta):
	for i in range(texture_rects.size()):
		texture_rects[i].rotation += rotation_rate[i] * delta
