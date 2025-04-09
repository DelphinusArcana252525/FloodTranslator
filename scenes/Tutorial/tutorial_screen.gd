extends Node2D

class_name tutorial_screen

@export var open_rect_pos: Vector2i
@export var open_rect_size: Vector2i
@export var text_rect_pos: Vector2i
@export var text_rect_size: Vector2i
signal next
signal back

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_positions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_poses (open_pos: Vector2i, open_size: Vector2i, text_pos: Vector2i, text_size: Vector2i, text: String) -> void:
	open_rect_pos = open_pos
	open_rect_size = open_size
	text_rect_pos = text_pos
	text_rect_size = text_size
	$Label/Text.text = text
	update_positions()

func update_positions () -> void:
	$Block_and_shade/Top_left_corner.position = open_rect_pos
	$Block_and_shade/Bottom_right_corner.position = open_rect_pos + open_rect_size
	$Label.position = text_rect_pos
	$Label.size = text_rect_size
	$Label/Text.size = text_rect_size - Vector2i(20, 20)
	$Block_and_shade.update_rect_poses()
	$Label.update_poses()

func _on_next_button_pressed() -> void:
	next.emit()

func _on_back_button_pressed() -> void:
	back.emit()

func is_mouse_clickable () -> bool:
	return $Block_and_shade.is_mouse_clickable()
