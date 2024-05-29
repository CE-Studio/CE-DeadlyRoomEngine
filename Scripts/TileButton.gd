extends TextureButton


var tile_id = 0
var texture_instance:AtlasTexture

signal button_clicked


func _ready():
	texture_instance = AtlasTexture.new()
	texture_instance.atlas = load("res://Textures/PlaceholderTileset.png")
	texture_normal = texture_instance
	texture_pressed = texture_instance
	texture_hover = texture_instance
	texture_disabled = texture_instance
	texture_focused = texture_instance


func _process(_delta):
	pass


func set_tile(new_id:int):
	tile_id = new_id
	texture_normal.region = Rect2i(0, 64 * new_id, 64, 64)


func _on_pressed():
	button_clicked.emit(tile_id)
