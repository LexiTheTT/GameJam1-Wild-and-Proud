extends AnimatableBody2D

@onready var marker = self.get_parent().get_node("Marker")
var mouse_pos = get_global_mouse_position()

#This exist because I don't trust custom cursors.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	_Go_toMouse()
	if Input.is_action_just_pressed("left_click"):
		marker.position = mouse_pos
		pass
	if Input.is_action_just_pressed("right_click"):
		#Maybe used to build and destory?
		pass

	pass
#I try to write things so it can logicly be read... but I'm just that goofy.
func _Go_toMouse():
	mouse_pos = get_global_mouse_position()
	self.position = mouse_pos
