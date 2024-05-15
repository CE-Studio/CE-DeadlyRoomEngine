extends VBoxContainer


var buttons:Array = [ ]
var placeholder_tiles = load("res://Textures/PlaceholderTileset.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	# Placeholder menu
	for i in 7:
		var new_button = TextureButton.new()
		add_child(new_button)
		var button_texture = AtlasTexture.new()
		button_texture.atlas = placeholder_tiles
		button_texture.region = Rect2(0, 64 * i, 64, 64)
		new_button.texture_normal = button_texture
		new_button.texture_pressed = button_texture
		new_button.texture_hover = button_texture
		new_button.texture_disabled = button_texture
		new_button.texture_focused = button_texture
		new_button.stretch_mode = TextureButton.STRETCH_KEEP_CENTERED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


# Todo: tile button as scene
