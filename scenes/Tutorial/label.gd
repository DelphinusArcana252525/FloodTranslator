extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_poses()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_poses () -> void:
	var text_offset = Vector2i(20,20)
	$Text.position = text_offset
	$Text.size = size
	var button_height = $Next_button.size.y
	$Next_button.position = Vector2i(0, size.y - button_height)
	var back_width = $Back_button.size.x
	$Back_button.position = Vector2i(size.x - back_width, size.y - button_height)
