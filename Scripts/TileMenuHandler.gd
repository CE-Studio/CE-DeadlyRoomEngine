extends VBoxContainer


var buttons:Array = [ ]
var placeholder_tiles = load("res://Textures/PlaceholderTileset.png")
var tile_button = load("res://Scenes/Objects/UI/TileButton.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	# Placeholder menu
	for i in 7:
		var new_button = tile_button.instantiate()
		add_child(new_button)
		new_button.set_tile(i)
		new_button.button_clicked.connect($"../../../StaticBody3D".change_tile)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
