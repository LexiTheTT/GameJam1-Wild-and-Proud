extends Area2D

@onready var Kale: CharacterBody2D = $Kale
@onready var K_HitBox: CollisionShape2D = $K_HitBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("GOT IT !! ", K_HitBox)

