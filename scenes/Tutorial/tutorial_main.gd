extends Node2D

var current_screen: tutorial_screen
var screen_index: int
var screen_scene
var flood_text_pos = Vector2i(912, 448)
var flood_text_size = Vector2i(200,150)
var translate_text_pos = Vector2i(912, 300)
var button_open_pos = Vector2i(96,256)
var button_open_size = Vector2i(96,96)
var zero = Vector2i(0,0)
var viewport_size = Vector2i(1152, 624)

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
var messages_before_translate: Array[String] = ["Welcome to Flood Translator!",
"To start playing, we need a shape, so click on 'translate'"]
var messages_after_first_translate: Array[String] = ["Now, hover over the button, the little black square connected to wires", # here
"To open the door (the brown square) we need to press the button. Shapes can do that for us.",
"Hover over the button and press ‘p’ to place the shape."]
var messages_after_button: Array[String] = ["Congratulations!",
"Okay, now we have a different shape. Click to translate it."]
var messages_after_second_translate: Array[String] = ["The grey tiles are ‘inaccessible’, so we can’t place shapes there.",
"But we can still place them if the mouse is on an accessible one.",
"Hover over the bottom row of white tiles, then press ‘p’ to place the tile.",
"Congratulations!",
"Be careful here. The accessible tiles can’t propagate through colored ones.",
"Instead, we need to hit the button beyond the wall. You can press ‘s’ to change shapes.",
"Congratulations!",
"A word of advice: you can place red shapes on red tiles and blue shapes on blue tiles, but you can’t place red shapes on blue tiles or vice versa. ",
"Congratulations",
"Try this one on your own.",
"Congratulations!",
"One more translation!",
"Congratulations!"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_scene = preload("res://scenes/Tutorial/tutorial_screen.tscn")
	for message in messages_before_translate:
		screens.append(Screen.new(zero, viewport_size, flood_text_pos, flood_text_size, message))
	screens.append(Screen.new(zero, viewport_size, translate_text_pos, flood_text_size, "Follow these instructions"))
	for message in messages_after_first_translate:
		screens.append(Screen.new(button_open_pos, button_open_size, flood_text_pos, flood_text_size, message))
	for message in messages_after_button:
		screens.append(Screen.new(zero, viewport_size, flood_text_pos, flood_text_size, message))
	screens.append(Screen.new(zero, viewport_size, translate_text_pos, flood_text_size, "Hit next when you're done with the translation."))
	for message in messages_after_second_translate:
		screens.append(Screen.new(zero, viewport_size, flood_text_pos, flood_text_size, message))
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
