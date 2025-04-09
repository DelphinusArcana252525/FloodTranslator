extends Area2D

@export var meaning : Array
@export var currMeaning : String
@export var isDocked : bool
var sprite 
var matrix
var size = 32
var canMove : bool = true
@export var tile_atlas : TileSet
#number of the tile in the arrays
var tileNum
var setDown
var mouseInShape
var isHidden

var isCurrTile
#gonna have a resource? list of resources?
#with shapes/colliders/sprites/words

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	isHidden = false
	mouseInShape = false
	setDown = false
	tileNum = 9
	 # Replace with function body.
	_get_tile(tileNum)
	print(currMeaning)
	$Label.text = currMeaning
	
	#$shape_sprite = 

func set_curr_tile(boolean):
	isCurrTile = boolean
	isDocked = not boolean
	setDown = not boolean

func _get_tile(num):
	$shape_sprite.frame = num
	currMeaning = meaning[num]
	$Label.text = currMeaning
	#$Label.text = currMeaning
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	if(_can_move()):
		move_Tile()
		
		
	
#get input from player - r rotate, follow mouse, click

func _can_move():
	if(isDocked or setDown or not isCurrTile or isHidden):
		return false
	return true
	
	
func hide_shape():
	$shape_sprite.hide()
	isHidden = true
	
	
func show_shape():
	$shape_sprite.show()
	isHidden = false

func _input(event: InputEvent):
	if(setDown):
		if(Input.is_action_pressed("left_click")):
			if(isDocked or setDown and mouseInShape):
				isDocked = false
				setDown = false
				
				#var scene = load("res://scenes/word_shape.tscn")
				#var instance = scene.instantiate()
			#var mouse_pos = get_viewport().get_mouse_position()
			#var xpos = int(mouse_pos.x / 32) * 32
			#var ypos = int(mouse_pos.y / 32) * 32
				#instance.position = Vector2i(0,0)
				#instance.set_tile_num(tileNum)
				#instance._get_tile(tileNum)
				#add_child(instance)
				print("clicked")
		if(not isDocked and mouseInShape and Input.is_action_just_pressed("delete_shape")):
			pass
			#$shape_sprite.hide()
		return
	if(Input.is_action_just_pressed("set_down")):
		setDown = true
		print("tile set down")
	
		#maybe do another thing??
		
func move_Tile(): # literally the worst naming convention ever
	var mouse_pos = get_viewport().get_mouse_position()
	self.position.x = int(mouse_pos.x / 32) * 32
	self.position.y = int(mouse_pos.y / 32) * 32
	if(not isDocked and Input.is_action_just_pressed("rotate")):
		$shape_sprite.rotate(PI/2)

func set_tile_num(num):
	tileNum = num
	
func set_docked(boolean):
	isDocked = boolean

func _on_mouse_entered() -> void:
	mouseInShape = true
	print("mouse entereD")
	#if mouse is clicked, then choose the shape it's hovering over
	#if isDocked. if not isDocked, that mouse goes to the docked
	#position.
	

	 # Replace with function body.


func _on_mouse_exited() -> void:
	mouseInShape = false
