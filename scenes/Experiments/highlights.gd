extends TileMapLayer

const red_tile = 1
const yellow_tile = 2
const blue_tile = 3
var current_color = yellow_tile
var tile_poses: Array[Vector2i] = [Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2), Vector2i(-1,-1)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_shape(Vector2i(2,2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	display_shape(get_mouse_tile())

func get_mouse_tile () -> Vector2i:
	var tile_width = tile_set.tile_size.x
	var tile_height = tile_set.tile_size.y
	var mouse_pos = get_viewport().get_mouse_position()
	var mouse_x = floori(mouse_pos.x / tile_width)
	var mouse_y = floori(mouse_pos.y / tile_height)
	return Vector2i(mouse_x, mouse_y)

func display_shape (origin_pos: Vector2i) -> void:
	clear()
	for pos in tile_poses:
		set_cell(origin_pos + pos, 0, Vector2i(0,0), current_color)
		#print(get_cell_alternative_tile(origin_pos + pos))
