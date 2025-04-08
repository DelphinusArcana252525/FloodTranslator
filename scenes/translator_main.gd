extends Node2D

var mouse
var levelNum
var wordShapes
var currIndex
var answer
signal win
signal exit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wordShapes = [$word_shape, $shapes_dock/word_shape, $shapes_dock/word_shape2, $shapes_dock/word_shape3, $shapes_dock/word_shape4, $shapes_dock/word_shape5]
	levelNum = 0
	setLevel(levelNum)
	currIndex = 0
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_pressed("left_click")):
		var mouse_pos = get_viewport().get_mouse_position()
		for i in range(0, len(wordShapes)):
			if (abs(wordShapes[i].position.x - mouse_pos.x) < 64 and abs(wordShapes[i].position.y - mouse_pos.y) < 64):
				wordShapes[currIndex].set_curr_tile(false)
				wordShapes[i].set_curr_tile(true)
				currIndex = i
			
		
	
func setLevel(levelNum):
	
	answer = "I do not think"
	$word_shape.set_curr_tile(true)
	#puzzle:
	$puzzle_shape/puzzle_sprite.frame = levelNum
	wordShapes[0].set_tile_num(10)
	wordShapes[0]._get_tile(10)
	
	wordShapes[1].set_tile_num(10)
	wordShapes[1]._get_tile(10)
	
	wordShapes[2].set_tile_num(8)
	wordShapes[2]._get_tile(8)
	
	wordShapes[3].set_tile_num(4)
	wordShapes[3]._get_tile(4)
	
	
	
	
	
	pass
	
	
#puzzle shape on tilemap? then maybe can check if mouse_pos
#is in a puzzle tile. or have a tilemap where several tiles
#have the property of "you can't place anything here" so its
#dependent upon the word_shape sprite position

#maybe each word shape has a height and width variable idk
	
	


func _on_win_button_pressed() -> void:
	win.emit()

func _on_exit_button_pressed() -> void:
	exit.emit()
