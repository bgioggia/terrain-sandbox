extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var vertices = GenerateFlatLandPRIMTRI()
	var vertices = GenerateFlatLandPRIMTRISTRIP()
	#vertices.push_back(Vector3(1, 0, 1))
	#vertices.push_back(Vector3(-1, 0, 1))
	#vertices.push_back(Vector3(1, 0, -1))

	# Initialize the ArrayMesh.
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices

	# Create the Mesh.
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLE_STRIP, arrays)
	mesh = arr_mesh
	
	
	

func GenerateFlatLandPRIMTRI() -> PackedVector3Array:
	#hardcoded flatland that is 400 units in all directions
	var vertices = PackedVector3Array()

	for x in range(-5, 5):
		for z in range(-5, 5):
			vertices.push_back(Vector3(x + 0.5, 0, z - 0.5))
			vertices.push_back(Vector3(x - 0.5, 0, z - 0.5))
			vertices.push_back(Vector3(x - 0.5, 0, z + 0.5))
			vertices.push_back(Vector3(x + 0.5, 0, z - 0.5))
			vertices.push_back(Vector3(x + 0.5, 0, z + 0.5))
			vertices.push_back(Vector3(x - 0.5, 0, z + 0.5))
	return vertices


func GenerateFlatLandPRIMTRISTRIP() -> PackedVector3Array:
	#hardcoded flatland that is 400 units in all directions
	var vertices = PackedVector3Array()

	for x in range(-5, 5):
		for z in range(-5, 5):
			vertices.push_back(Vector3(x + 0.5, 0, z - 0.5))
			vertices.push_back(Vector3(x - 0.5, 0, z - 0.5))
			vertices.push_back(Vector3(x + 0.5, 0, z + 0.5))
			vertices.push_back(Vector3(x - 0.5, 0, z + 0.5))
	return vertices
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
