class_name FirstLevelAttempt
extends Node2D

const tile_size = 32
var shape_index: int = 0
var shapes: Array #= [[Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2), Vector2i(-1,-1)],
#[Vector2i(-1,-1),Vector2i(-1,0),Vector2i(-1,1),Vector2i(0,1),Vector2i(1,1),Vector2i(1,0),Vector2i(1,-1),Vector2i(0,-1)],
#[Vector2i(-2,0),Vector2i(-1,0),Vector2i(0,0),Vector2i(1,0),Vector2i(2,0)]]
var colors = [2,3,4]
var current_color_index = 0
@export var shapes_resource: Resource
signal has_won

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shapes = shapes_resource.shapes
	$Map.propogate_all()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(shapes[shape_index])
	if shapes.size() > 0:
		$Highlight_Layer.display_shape(shapes[shape_index], get_mouse_tile_internal(), colors[current_color_index])

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space"):
		$Map.propogate_all()
		#print($Map.propogate_accessibles())
		#print($Map.activate_buttons())
		#print($Map.propogate_wires())
		#print("hi")
	if event.is_action_pressed("next_color"):
		current_color_index += 1
		if current_color_index >= colors.size():
			current_color_index = 0
	if event.is_action_pressed("next_shape"):
		shape_index += 1
		if shape_index >= shapes.size():
			shape_index = 0
	if event.is_action_pressed("place_shape"):
		if shapes.size() > 0: 
			$Map.place_shape(shapes[shape_index], get_mouse_tile_internal(), colors[current_color_index])
		$Map.propogate_all()
		if ($Map.has_won()) :
			has_won.emit()


func get_mouse_tile_internal () -> Vector2i :
	return get_mouse_tile(get_viewport(), tile_size, tile_size)

static func get_mouse_tile (viewport: Viewport, tile_width: int, tile_height: int) -> Vector2i:
	var mouse_pos = viewport.get_mouse_position()
	var mouse_x = floori(mouse_pos.x / tile_width)
	var mouse_y = floori(mouse_pos.y / tile_height)
	return Vector2i(mouse_x, mouse_y)
