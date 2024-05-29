extends StaticBody3D


var vox:VoxelToolTerrain


var mouse_down:bool = false
var rect_corner:Vector3i
var current_tile:int = 1
@onready var selection_box:MeshInstance3D = $SelectionIndicator
var selection_alpha_timer:float


# Called when the node enters the scene tree for the first time.
func _ready():
	vox = $"../VoxelTerrain".get_voxel_tool()
	$"../VoxelTerrain".mesher.library.bake()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	selection_alpha_timer = fmod(selection_alpha_timer + (delta * 1.5), TAU)
	var parsed_alpha = sin(selection_alpha_timer) * 0.125 + 0.25
	selection_box.get_surface_override_material(0).albedo_color.a = parsed_alpha


func _on_input_event(_cam, event, pos, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			mouse_down = true
			rect_corner = Vector3i(floori(pos.x), 0, floori(pos.z))
		else:
			mouse_down = false
			var new_rect_corner = Vector3i(floori(pos.x), 0, floori(pos.z))
			vox.mode = VoxelTool.MODE_SET
			vox.value = current_tile
			vox.do_box(rect_corner, new_rect_corner)
	if event is InputEventMouseMotion:
		var current_pos = Vector3i(floori(pos.x), 0, floori(pos.z))
		if mouse_down:
			selection_box.position.x = lerpf(rect_corner.x, current_pos.x, 0.5) + 0.5
			selection_box.position.z = lerpf(rect_corner.z, current_pos.z, 0.5) + 0.5
			selection_box.mesh.size.x = absf(rect_corner.x - current_pos.x) + 1.25
			selection_box.mesh.size.z = absf(rect_corner.z - current_pos.z) + 1.25
		else:
			selection_box.position = Vector3i(floori(current_pos.x) + 0.5, 0, floori(current_pos.z) + 0.5)
			selection_box.mesh.size = Vector3(1.25, 1.25, 1.25)


func change_tile(new_tile:int):
	current_tile = new_tile + 1
