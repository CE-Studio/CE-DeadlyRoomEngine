extends StaticBody3D


var vox:VoxelToolTerrain


# Called when the node enters the scene tree for the first time.
func _ready():
	vox = $"../VoxelTerrain".get_voxel_tool()
	$"../VoxelTerrain".mesher.library.bake()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		print(position)
		vox.set_voxel(position, 1)
