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
	levelNum = 2
	setLevel(levelNum)
	currIndex = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_pressed("left_click")):
		var mouse_pos = get_viewport().get_mouse_position()
		for i in range(0, len(wordShapes)):
			if (abs(wordShapes[i].position.x - mouse_pos.x) < 64 and abs(wordShapes[i].position.y - mouse_pos.y) < 64):
				if(not wordShapes[currIndex].isHidden):
					wordShapes[currIndex].set_curr_tile(false)
					wordShapes[i].set_curr_tile(true)
					currIndex = i
			
		
	
func setLevel(levelNum):
	$puzzle_shape/puzzle_sprite.frame = levelNum
	answer = $puzzle_shape.translation[levelNum]
	if(levelNum == 0):
		#answer = "I do not think"
		$word_shape.set_curr_tile(true)
		$instructions.show()
		#puzzle:
		
		wordShapes[0].set_tile_num(10)
		wordShapes[0]._get_tile(10)
	
		wordShapes[1].set_tile_num(4)
		wordShapes[1]._get_tile(4)
	
		wordShapes[2].set_tile_num(8)
		wordShapes[2]._get_tile(8)
	
		wordShapes[5].set_tile_num(9)
		wordShapes[5]._get_tile(9)
	
		wordShapes[4].hide()
	
		wordShapes[3].hide()
		
	if(levelNum == 1):
		#answer = "It goes"
		$instructions.hide()
		$word_shape.set_curr_tile(true)
		
		#$puzzle_shape/puzzle_sprite.frame = levelNum
		
		wordShapes[0].set_tile_num(6)
		wordShapes[0]._get_tile(6)
		
		wordShapes[3].set_tile_num(3)
		wordShapes[3]._get_tile(3)
		
		wordShapes[2].set_tile_num(11)
		wordShapes[2]._get_tile(11)
		
		wordShapes[4].hide()
	
		wordShapes[5].hide()
		
		wordShapes[1].hide()
		
		
		#create the wordShapes
		
		
		
	if(levelNum == 2):
		$instructions.hide()
		$word_shape.set_curr_tile(true)
		
		wordShapes[0].set_tile_num(3)
		wordShapes[0]._get_tile(3)
		
		wordShapes[1].set_tile_num(10)
		wordShapes[1]._get_tile(10)
		
		wordShapes[2].set_tile_num(14)
		wordShapes[2]._get_tile(14)
		
		wordShapes[3].set_tile_num(12)
		wordShapes[3]._get_tile(12)
		
		wordShapes[5].set_tile_num(7)
		wordShapes[5]._get_tile(7)
		
		wordShapes[4].hide()
		
		#answer = "I go to a place"
	
	
#puzzle shape on tilemap? then maybe can check if mouse_pos
#is in a puzzle tile. or have a tilemap where several tiles
#have the property of "you can't place anything here" so its
#dependent upon the word_shape sprite position

#maybe each word shape has a height and width variable idk
	
	


#func _on_win_button_pressed() -> void:
	#win.emit()

func _on_exit_button_pressed() -> void:
	exit.emit()


func _on_word_box_text_changed() -> void:
	if($word_box.text.to_lower() == (answer.to_lower())):
		win.emit()
		print("good job joe")
	pass # Replace with function body.
