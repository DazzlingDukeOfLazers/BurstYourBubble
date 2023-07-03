extends Node

# Reference to your SVG file
var svg_path = "res://svg/bird.svg"

# Scales to apply
var scales = [0.5, 1, 1.5, 2]

func _ready():
	for i in range(scales.size()):
		# Create a new TextureRect
		var texture_rect = TextureRect.new()

		# Load SVG as StreamTexture
		var svg_texture = load(svg_path)

		# Assign the texture to TextureRect
		texture_rect.texture = svg_texture

		# Apply scale
		texture_rect.scale = Vector2(scales[i], scales[i])

		# Add the TextureRect as a child of the current node
		add_child(texture_rect)

		# Position the TextureRect so they don't overlap
		texture_rect.position = Vector2(i * svg_texture.get_width() * scales[i], 0)
