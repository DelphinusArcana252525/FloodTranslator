extends FirstLevelAttempt

var translate_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shapes = []
	translate_scene = preload("res://scenes/translator_main.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_translate_button_pressed() -> void:
	add_child(translate_scene.instantiate())
