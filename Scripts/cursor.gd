extends AnimatableBody2D

@export var Mouse_Debugs = false

@onready var marker = self.get_parent().get_node("Marker")
var mouse_pos = get_global_mouse_position()
@onready var Tile_Map = $"../../TileMap"

#This exist because I don't trust custom cursors.

var papers = int(1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	marker.set("visible",false)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	_Go_toMouse()
	if Input.is_action_just_pressed("left_click"):
		#make the pos of the marker the same as mouse
		marker.set("visible",true)
		marker.position = mouse_pos

	if Input.is_action_just_pressed("right_click"):
		
		#Local cords from where the mouse clicked
		var local_coords = Tile_Map.local_to_map(mouse_pos)
		#clicked cell's data
		var clicked_cell = Tile_Map.get_cell_source_id(0,local_coords)
		
		#We get the tileset
		var tile_set = Tile_Map.tile_set
		#Then we get what the fuck we clicked
		var tile_set_source = tile_set.get_source(clicked_cell)
		#Tada!! The name!
		var cell_name = ""
		if clicked_cell == -1:
			cell_name = "Nothing"
		else:
			cell_name = tile_set_source.resource_name 
		#Tile_Map.set_cell()
		print(local_coords, "  which is ", clicked_cell, ": ", cell_name)

		if cell_name == "empty" and papers >=1:
			papers -= 1
			print("Papers : ", papers)
	
#I try to write things so it can logicly be read... but I'm just that goofy.
func _Go_toMouse():
	mouse_pos = get_global_mouse_position()
	self.position = mouse_pos
