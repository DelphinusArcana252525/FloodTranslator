extends Node2D

var current_screen: tutorial_screen
var screen_index: int
var screen_scene

class Screen:
	var open_top_left: Vector2i
	var open_size: Vector2i
	var text_top_left: Vector2i
	var text_size: Vector2i
	var text: String
	
	func _init(open_pos: Vector2i, o_size: Vector2i, text_pos: Vector2i, text_siz: Vector2i, txt: String) :
		open_top_left = open_pos
		open_size = o_size
		text_top_left = text_pos
		text_size = text_siz
		text = txt

var screens: Array[Screen] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_scene = preload("res://scenes/Tutorial/tutorial_screen.tscn")
	screens.append(Screen.new(Vector2i(20,20), Vector2i(150,150), Vector2i(300, 400), Vector2i(300, 200), "Click the start button"))
	screens.append(Screen.new(Vector2i(50,100), Vector2i(100,120), Vector2i(200, 500), Vector2i(400, 100), "Words words words words wrords worosd wossrodow sowodorosodow"))
	change_screen(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_current_screen_next () -> void:
	change_screen(screen_index + 1)

func _on_current_screen_back () -> void:
	change_screen(screen_index - 1)

func change_screen (index: int) -> void:
	if screens.size() <= index:
		print("done")
		current_screen.queue_free()
		return
	if index < 0:
		print("nope")
		return
	screen_index = index
	var screen = screens[screen_index]
	if current_screen != null:
		current_screen.queue_free()
	var new_screen = screen_scene.instantiate()
	new_screen.change_poses(screen.open_top_left, screen.open_size, screen.text_top_left, screen.text_size, screen.text)
	add_child(new_screen)
	new_screen.next.connect(_on_current_screen_next)
	new_screen.back.connect(_on_current_screen_back)
	current_screen = new_screen

func is_mouse_clickable () -> bool:
	return current_screen.is_mouse_clickable()
