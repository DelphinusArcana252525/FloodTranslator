extends FirstLevelAttempt

var translate_scene
var translate_node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	shapes = []
	colors = [4]
	translate_scene = preload("res://scenes/translator_main.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)


func _on_translate_button_pressed() -> void:
	translate_node = translate_scene.instantiate()
	translate_node.setLevel(2)
	translate_node.win.connect(_on_translate_win)
	translate_node.exit.connect(_on_translate_exit)
	add_child(translate_node)

func _on_translate_win () -> void:
	translate_node.queue_free()
	shapes.append([Vector2i(0,0),Vector2i(0,1),Vector2i(0,2),Vector2i(0,3),
	Vector2i(1,0),Vector2i(1,1),Vector2i(1,2),Vector2i(1,3),
	Vector2i(2,0),Vector2i(2,1),Vector2i(2,2),Vector2i(2,3),
	Vector2i(3,0),Vector2i(3,1),Vector2i(3,2),Vector2i(3,3)])

func _on_translate_exit() -> void:
	translate_node.queue_free()
