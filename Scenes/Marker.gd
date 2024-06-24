extends Area2D
@onready var col = $Colision_Shape
@onready var Kale = $"../Kale"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if has_overlapping_bodies():
		await(move_me())
	position = position.snapped(Vector2(16,16))



func move_me():
	while has_overlapping_bodies():
		position.y -= 16
		print(position.y)
		return