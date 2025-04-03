extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_rect_poses()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(is_mouse_clickable())
	pass

#true if mouse isn't over any grey boxes, false if it is
func is_mouse_clickable () -> bool:
	var top_left = $Top_left_corner.position
	var bottom_right = $Bottom_right_corner.position
	var mouse_pos = get_viewport().get_mouse_position()
	var works_with_top_left: bool = mouse_pos.x >= top_left.x and mouse_pos.y >= top_left.y
	var works_with_bottom_right: bool = mouse_pos.x <= bottom_right.x and mouse_pos.y <= bottom_right.y
	return works_with_top_left and works_with_bottom_right

func update_rect_poses () -> void:
	var top_left = $Top_left_corner.position
	var bottom_right = $Bottom_right_corner.position
	var viewport_size = Vector2i(get_viewport_rect().size)
	$Top_left_rect.position = Vector2i(0,0)
	$Top_left_rect.size = Vector2i(bottom_right.x, top_left.y)
	$Top_right_rect.position = Vector2i(bottom_right.x, 0)
	$Top_right_rect.size = Vector2i(viewport_size.x - bottom_right.x, bottom_right.y)
	$Bottom_right_rect.position = Vector2i(top_left.x, bottom_right.y)
	$Bottom_right_rect.size = Vector2i(viewport_size.x - top_left.x, viewport_size.y - bottom_right.y)
	$Bottom_left_rect.position = Vector2i(0, top_left.y)
	$Bottom_left_rect.size = Vector2i(top_left.x, viewport_size.y - top_left.y)
