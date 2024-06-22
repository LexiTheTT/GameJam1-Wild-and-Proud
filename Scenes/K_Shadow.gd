extends Area2D

@onready var Kale = $Kale
@onready var K_HitBox = $K_HitBox
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("GOT IT !! ", K_HitBox)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
