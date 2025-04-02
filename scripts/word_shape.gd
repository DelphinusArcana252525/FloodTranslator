extends Area2D

@export var meaning : Array
var currMeaning
var sprite 
var matrix
var size = 32
var canMove : bool = true
@export var tile_atlas : TileSet
#gonna have a resource? list of resources?
#with shapes/colliders/sprites/words

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	_get_tile(9)
	print(currMeaning)
	
	#$shape_sprite = 


func _get_tile(num):
	$shape_sprite.frame = num
	currMeaning = meaning[num]
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	if(canMove):
		move_Tile()
	
#get input from player - r rotate, follow mouse, click

func _input(event: InputEvent):
	if(Input.is_action_just_pressed("set_down")):
		canMove = false
		print("tile set down")
	if(Input.is_action_just_pressed("delete_shape")):
		$shape_sprite.hide()
		#maybe do another thing??
	if(Input.is_action_just_pressed("rotate")):
		$shape_sprite.rotate(PI/2)
		
func move_Tile():
	var mouse_pos = get_viewport().get_mouse_position()
	self.position.x = int(mouse_pos.x / 32) * 32
	self.position.y = int(mouse_pos.y / 32) * 32
