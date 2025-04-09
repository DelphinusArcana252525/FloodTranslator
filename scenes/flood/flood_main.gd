extends Node2D

var flood_scenes = [preload("res://scenes/flood/Levels/flood_level_0.tscn"), 
preload("res://scenes/flood/Levels/flood_level_1.tscn"),
preload("res://scenes/flood/Levels/flood_level_2.tscn"),
preload("res://scenes/flood/Levels/flood_level_3.tscn"),
preload("res://scenes/flood/Levels/flood_level_4.tscn"),
preload("res://scenes/flood/Levels/flood_level_5.tscn")]
var scene_index
var current_flood_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scene_index = 0
	change_screen(scene_index)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(scene_index)
	pass

func _on_level_0_next_pressed() -> void:
	change_screen(scene_index + 1)
	"""
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
	"""

func _on_flood_scene_has_won () -> void:
	$Next_Button.show()

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

func _on_level_reset () -> void:
	change_screen(scene_index)

func change_screen (index: int) -> void:
	if flood_scenes.size() <= index:
		print("done")
		current_flood_scene.queue_free()
		return
	if index < 0:
		print("nope")
		return
	scene_index = index
	var scene_at_index = flood_scenes[scene_index]
	if current_flood_scene != null:
		current_flood_scene.queue_free()
	var new_scene = scene_at_index.instantiate()
	add_child(new_scene)
	new_scene.has_won.connect(_on_flood_scene_has_won)
	new_scene.reset.connect(_on_level_reset)
	current_flood_scene = new_scene
	$Next_Button.hide()
	print("sup")
