extends Node2D

var flood_scenes = [preload("res://scenes/flood/Levels/flood_level_0.tscn"), preload("res://scenes/flood/Levels/flood_level_1.tscn")]
var scene_index

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Flood_Level_0.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_flood_level_0_has_won() -> void:
	$Next_Button.show()

func _on_level_0_next_pressed() -> void:
	$Next_Button.hide()
	$Flood_Level_0.hide()
	$flood_level_1.show()
