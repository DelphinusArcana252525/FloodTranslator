extends TileMapLayer

var current_shape: Array[Vector2i] = [Vector2i(0,0)]
const source = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var mouse_tile = FirstLevelAttempt.get_mouse_tile(get_viewport(), tile_set.tile_size.x, tile_set.tile_size.y)
	pass

const color_row = 1
const transparent_alt = 1

func display_shape(shape: PackedVector2Array, origin_tile: Vector2i, color: int) -> void:
	clear()
	for pos in shape:
		var i_pos = Vector2i(pos)
		set_cell(origin_tile + i_pos, source, Vector2i(color, color_row), transparent_alt)

func clear_tiles () -> void:
	clear()
