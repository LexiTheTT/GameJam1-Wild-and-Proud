class_name Anchor2d
extends CharacterBody2D
# This script controls the camera movement

@export_category("🎯Target")

## The node that the camera will follow
@export var target: Node

## The player character
@export var player: CharacterBody2D

@export_category("⚙️Settings")

@export var debug = false

@export var speed = int()
@export var Freeze_Cam = false
@export var lock_X = false
@export var lock_Y = false
@export var cam_offset = Vector2()
## The size of the window in pixels
var window_size = get_viewport_rect().size
## The camera node
@onready var cam = $Camera2D
## The base speed of the camera
@onready var base_cam_speed = speed


@export_category("🔢Math")

## The acceleration of the camera
@export var distance_threashold = 30
var Accel = 40
## The current speed of the camera
@onready var camera_speed = float()



# Called when the node enters the scene tree for the first time.
func _ready():
	if target == null:
		target = self
	if debug:
		print("I ",self,", will follow ", target)
	camera_speed = base_cam_speed
	cam.set_position_smoothing_speed(camera_speed)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#print(cam_offset)
	var target_pos = target.global_position+cam_offset
	var distance = global_position.distance_to(target_pos)
	var mod_speed = speed + distance * delta * Accel
	var camera_pos = lerp(global_position, target_pos, 0.1)
	set_global_position(camera_pos)
	cam.set_position_smoothing_speed(clamp(camera_speed, 0, 80))
	if debug:
		print(camera_speed ,"   /  ",base_cam_speed-20)


	
	# print(clamp(camera_speed, 0, 140)," = ",mod_speed," / ",distance, "Cords ")

	#MOVE MOVE MOVE
	if !Freeze_Cam:
		position = position.move_toward(target_pos, camera_speed * delta)
	move_and_slide()
	pass
