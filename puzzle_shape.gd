extends Area2D

@export var translation : Array[String]
var currTranslation


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _get_puzzle(num):
	$puzzle_sprite.frame = num
	currTranslation = translation[num]

	
