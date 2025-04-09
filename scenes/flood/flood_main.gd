extends Node2D

var flood_scenes = [preload("res://scenes/flood/Levels/flood_level_0.tscn"), preload("res://scenes/flood/Levels/flood_level_1.tscn")]
var scene_index

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scene_index = 0
	$Flood_Level_0.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(scene_index)
	pass

# TODO: this should really be adding and removing scenes as children, not just hiding them

func _on_level_0_next_pressed() -> void:
	print(scene_index)
	$Next_Button.hide()
	if scene_index == 0:
		$Flood_Level_0.queue_free()
		$flood_level_1.show()
	elif scene_index == 1:
		$flood_level_1.queue_free()
		$flood_level_2.show()
	elif scene_index == 2:
		$flood_level_2.queue_free()
		$flood_level_3.show()
	elif scene_index == 3:
		$flood_level_3.queue_free()
		$flood_level_4.show()
	elif scene_index == 4:
		$flood_level_4.queue_free()
	scene_index += 1

func _on_flood_level_0_has_won() -> void:
	$Next_Button.show()

func _on_flood_level_1_has_won() -> void:
	print("hello")
	$Next_Button.show()

func _on_flood_level_2_has_won() -> void:
	$Next_Button.show()

func _on_flood_level_3_has_won() -> void:
	$Next_Button.show()

func _on_flood_level_4_has_won() -> void:
	$Next_Button.show()
