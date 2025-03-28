extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space"):
		stamp_shape()

func stamp_shape () -> void:
	print("stamp shape")
	var origin_pos = $Highlights.get_mouse_tile()
	var shape = $Highlights.tile_poses
	var tile_color = $Highlights.current_color
	$World.display_shape(origin_pos, shape, tile_color)
