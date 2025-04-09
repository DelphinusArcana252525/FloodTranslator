extends TileMapLayer

const accessible_floor = 1
const inaccessible_floor = 2
const wall = 3
const origin = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Could make this recursive if I wanted to, but I kind of like the animation
func propogate_tiles () -> void :
	for cell in get_used_cells_by_id(0, Vector2i(-1, -1), accessible_floor):
		for adj in get_surrounding_cells(cell):
			if get_cell_source_id(adj) == 0 and get_cell_alternative_tile(adj) == inaccessible_floor:
				set_cell(adj, 0, Vector2i(0, 0), accessible_floor)

func display_shape (origin_pos: Vector2i, tile_poses: Array[Vector2i], tile_color: int) -> void:
	print(tile_poses)
	for pos in tile_poses:
		var alt_title = get_cell_alternative_tile(origin_pos + pos)
		print(alt_title)
		var source = get_cell_source_id(origin_pos + pos)
		print(source)
		if source == 0 and (alt_title == 1 or alt_title == 2):
			set_cell(origin_pos + pos, 1, Vector2i(0,0), tile_color)

func _on_propogation_timer_timeout() -> void:
	propogate_tiles()
