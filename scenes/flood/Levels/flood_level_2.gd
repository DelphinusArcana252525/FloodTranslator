extends FirstLevelAttempt


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	shapes = []
	shapes.append([Vector2i(0,0),Vector2i(0,1),Vector2i(0,2),
	Vector2i(1,0),Vector2i(1,1),Vector2i(1,2),
	Vector2i(2,0),Vector2i(2,1),Vector2i(2,2),
	Vector2i(3,0),Vector2i(3,1),Vector2i(3,2)])
	shapes.append([Vector2i(0,0),Vector2i(0,1),Vector2i(0,2),Vector2i(0,3),
	Vector2i(1,0),Vector2i(1,1),Vector2i(1,2),Vector2i(1,3),
	Vector2i(2,0),Vector2i(2,1),Vector2i(2,2),Vector2i(2,3),
	Vector2i(3,0),Vector2i(3,1),Vector2i(3,2),Vector2i(3,3)])
	colors = [2,4]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
