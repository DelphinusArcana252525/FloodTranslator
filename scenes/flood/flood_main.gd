extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Flood_Level_0.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_flood_level_0_has_won() -> void:
	$Flood_Level_0.hide()
