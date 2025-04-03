extends Node2D

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

func update_positions () -> void:
	$Block_and_shade/Top_left_corner.position = open_rect_pos
	$Block_and_shade/Bottom_right_corner.position = open_rect_pos + open_rect_size
	$Label.position = text_rect_pos
	$Label.size = text_rect_size
	$Block_and_shade.update_rect_poses()
	$Label.update_poses()

func _on_next_button_pressed() -> void:
	next.emit()

func _on_back_button_pressed() -> void:
	back.emit()
