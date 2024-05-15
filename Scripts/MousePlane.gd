extends StaticBody3D


var vox:VoxelToolTerrain


var mouse_down:bool = false
var rect_corner:Vector3i


# Called when the node enters the scene tree for the first time.
func _ready():
	vox = $"../VoxelTerrain".get_voxel_tool()
	$"../VoxelTerrain".mesher.library.bake()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		#var floor_pos = Vector3(floor(position.x), 0.0, floor(position.z))
		#vox.set_voxel(floor_pos, 1)
		if event.pressed:
			rect_corner = Vector3i(floor(position.x), 0.0, floor(position.z))
		else:
			var new_rect_corner = Vector3i(floor(position.x), 0.0, floor(position.z))
			vox.mode = VoxelTool.MODE_SET
			vox.value = 1
			vox.do_box(rect_corner, new_rect_corner)
