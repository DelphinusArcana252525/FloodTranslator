extends TileMapLayer

var source = 4
var max_row = 5
signal win

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(has_won())
	pass

const accessible_col = 0
const inaccessible_col = 1;

func has_won () -> bool:
	for row in range(1,max_row + 1):
		if get_used_cells_by_id(source, Vector2i(inaccessible_col, row), -1).size() != 0:
			return false
	return true

#Will return whether the shape was allowed to be placed
func place_shape (shape: PackedVector2Array, origin_tile: Vector2i, color: int) -> bool:
	if not (shape_placeable(shape, origin_tile, color)):
		return false
	var shape_unpacked = Array(shape)
	for pos in shape_unpacked:
		var tile_atlas_pos = get_cell_atlas_coords(origin_tile + Vector2i(pos))
		if (tile_atlas_pos.x == accessible_col or tile_atlas_pos.x == inaccessible_col) and tile_atlas_pos.y >= 1:
			set_cell(origin_tile + Vector2i(pos), source, Vector2i(color, tile_atlas_pos.y), 0)
	return true

func shape_placeable (shape: PackedVector2Array, origin_tile: Vector2i, color: int) -> bool:
	var origin_atlas_pos = get_cell_atlas_coords(origin_tile)
	if origin_atlas_pos.y == 0 or not (origin_atlas_pos.x == accessible_col or origin_atlas_pos.x == color):
		return false
	var shape_unpacked = Array(shape)
	for pos in shape_unpacked:
		var tile_atlas_pos = get_cell_atlas_coords(origin_tile + Vector2i(pos))
		if tile_atlas_pos.x > inaccessible_col and tile_atlas_pos.x != color and tile_atlas_pos.y >= 1:
			return false
	return true

func propogate_once() -> bool:
	var to_return = propogate_accessibles()
	if propogate_wires():
		to_return = true
	if activate_buttons():
		to_return = true
	if (has_won()):
		win.emit()
	return to_return

func propogate_all () -> void :
	while propogate_once():
		pass

func propogate_accessibles () -> bool:
	var to_return = false
	for row in range(1,max_row + 1):
		for cell in get_used_cells_by_id(source, Vector2i(accessible_col, row), -1):
			for adj in get_surrounding_cells(cell):
				var adj_type = get_cell_atlas_coords(adj)
				if get_cell_source_id(adj) == source and adj_type.x == inaccessible_col and adj_type.y >= 1:
					to_return = true
					set_cell(adj, source, Vector2i(accessible_col, adj_type.y))
	return to_return

const inactive_buttons: Array[Vector2i] = [Vector2i(2,2), Vector2i(3,2), Vector2i(4,2)]

#returns whether or not it changed anything
func activate_buttons () -> bool:
	var to_return = false
	for tile_type in inactive_buttons:
		for cell in get_used_cells_by_id(source, tile_type, -1):
			to_return = true
			set_cell(cell, source, tile_type + Vector2i(0,1), 0)
	return to_return

const active_button_row = 3
const active_wire_row = 5

#returns whether or not it changed anything
func propogate_wires () -> bool:
	var to_return : bool = false
	#wires to wires
	for col in range(5):
		for cell in get_used_cells_by_id(source, Vector2i(col, active_wire_row), -1):
			for adj in get_surrounding_cells(cell):
				to_return = activate_wire(adj) or open_door(adj) or to_return
	#buttons to wires
	for col in range(5):
		#print("in first")
		for cell in get_used_cells_by_id(source, Vector2i(col, active_button_row), -1):
			#print("hello")
			for adj in get_surrounding_cells(cell):
				to_return = activate_wire(adj) or open_door(adj) or to_return
	return to_return

const inactive_wire_row = 4

#returns whether or not it activated a wire
func activate_wire (tile_coords : Vector2i) -> bool:
	var tile_type = get_cell_atlas_coords(tile_coords)
	if tile_type.y != inactive_wire_row:
		return false
	set_cell(tile_coords, source, tile_type + Vector2i(0,1))
	return true

const door_atlas_coords = Vector2i(1,0)
const inaccessible_coords = Vector2i(1,1)

# returns whether or not it opened a door
func open_door (tile_coords : Vector2i) -> bool:
	var tile_type = get_cell_atlas_coords(tile_coords)
	if tile_type != door_atlas_coords:
		return false
	set_cell(tile_coords, source, inaccessible_coords)
	return true


func _on_timer_timeout() -> void:
	propogate_once()
