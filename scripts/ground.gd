extends MeshInstance3D


var size = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var vertices = GenerateRandomHeightLandPRIMTRI()
	#var vertices = GenerateFlatLandPRIMTRISTRIP()
	#vertices.push_back(Vector3(1, 0, 1))
	#vertices.push_back(Vector3(-1, 0, 1))
	#vertices.push_back(Vector3(1, 0, -1))

	# Initialize the ArrayMesh.
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices

	# Create the Mesh.
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	#arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLE_STRIP, arrays)
	mesh = arr_mesh
	for vertex in vertices:
		print(vertex)
	print(len(vertices))
	print(len(vertices) / 3)
	
	
	

func GenerateFlatLandPRIMTRI() -> PackedVector3Array:
	var vertices = PackedVector3Array()
	for x in range(-1, 1):
		for z in range(-1, 1):
			vertices.push_back(Vector3(x - 0.5, 0, z + 0.5))
			vertices.push_back(Vector3(x + 0.5, 0, z - 0.5))
			vertices.push_back(Vector3(x + 0.5, 0, z + 0.5))
			
			vertices.push_back(Vector3(x - 0.5, 0, z + 0.5))
			vertices.push_back(Vector3(x - 0.5, 0, z - 0.5))
			vertices.push_back(Vector3(x + 0.5, 0, z - 0.5))
			
	return vertices


func GenerateRandomHeightLandPRIMTRI() -> PackedVector3Array:
	var vertices = PackedVector3Array()
	for x in range(0, size):
		for z in range(0, size):
			var topLeftSharedHeight = randf_range(-0.5, 0.5)
			var bottomRightSharedHeight = randf_range(-0.5, 0.5)
			var bottomLeftHeight = randf_range(-0.5, 0.5)
			var topRightHeight = randf_range(-0.5, 0.5)

			var topLeftOffset = x + z * 3
			var bottomLeftOffset = x + (z + 1) * 3
			var bottomRightOffset = (x + 1) + (z + 1) * 3

			if topLeftOffset < len(vertices) && vertices[topLeftOffset] != null:
				topLeftSharedHeight = vertices[topLeftOffset].y
			if bottomLeftOffset < len(vertices) && vertices[bottomLeftOffset] != null:
				bottomLeftHeight = vertices[bottomLeftOffset].y
			if bottomRightOffset < len(vertices) && vertices[bottomRightOffset] != null:
				bottomRightSharedHeight = vertices[bottomRightOffset].y
				
			vertices.push_back(Vector3(x - 0.5, topLeftSharedHeight, z + 0.5)) # top left
			vertices.push_back(Vector3(x + 0.5, bottomRightSharedHeight, z - 0.5)) # bottom right
			vertices.push_back(Vector3(x + 0.5, topRightHeight, z + 0.5)) # top right
			
			vertices.push_back(Vector3(x - 0.5, topLeftSharedHeight, z + 0.5)) # top left
			vertices.push_back(Vector3(x - 0.5, bottomLeftHeight, z - 0.5)) # bottom left
			vertices.push_back(Vector3(x + 0.5, bottomRightSharedHeight, z - 0.5)) # bottom right
			
	return vertices
	

#TODO THIS IS STILL BROKEN
func GenerateFlatLandPRIMTRISTRIP() -> PackedVector3Array:
	var vertices = PackedVector3Array()
	for x in range(-1, 1):
		for z in range(-1, 1):
			vertices.push_back(Vector3(x - 0.5, 0, z + 0.5))
			vertices.push_back(Vector3(x + 0.5, 0, z - 0.5))
			vertices.push_back(Vector3(x + 0.5, 0, z + 0.5))
			vertices.push_back(Vector3(x - 0.5, 0, z - 0.5))
	return vertices
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
