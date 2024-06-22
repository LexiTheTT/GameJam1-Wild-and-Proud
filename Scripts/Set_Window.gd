extends Node

@export_category("🔍Scale")

## The scale factor for the window size
@export var win_scale: int = 3

##
var monitor = DisplayServer.window_get_current_screen()
## The base size of the window in pixels
var window_size = DisplayServer.window_get_size()
var window_size_base = window_size
## The upscaled size of the window in pixels
var Upped_Win_Size
## The size of the screen in pixels
var screensize = DisplayServer.screen_get_size(monitor)

## The position of the window on the screen
@onready var win_pos = DisplayServer.window_get_position()

var win_max = Vector2i()
var win_max_determined = int()
var scale_array = []
var scale_index = int()

func set_winsize(new_win_scale):
	#Write to file the win_max_determined if there is nothing there.
	#If there is something check to see if it's greater than max, if so 
	#reject it and write the new max.

	screensize = DisplayServer.screen_get_size(monitor)
	#The New Window Size!
	Upped_Win_Size = window_size * new_win_scale
	if window_size != Upped_Win_Size:
		DisplayServer.window_set_size(Upped_Win_Size)
	else:
		DisplayServer.window_set_size(window_size_base)

	DisplayServer.window_set_position(screensize*0.5 - Upped_Win_Size*0.5, monitor)
	win_pos = DisplayServer.screen_get_position(monitor)
	print("New Size is ", Upped_Win_Size, " | Win Pos:", win_pos, screensize, "of ",monitor)
	
	#if stage.Total_Debuging:
		#print()

## Make settings ini that has the following.
## first ite
func _ready():
	# Get the current window size
	## If setting not set, make this the size
	window_size = DisplayServer.window_get_size()
	win_max = (screensize / window_size)
	monitor = DisplayServer.window_get_current_screen()
	if win_max.x > win_max.y:
		win_max_determined = win_max.y
		set_winsize(win_max_determined)
	elif win_max.x < win_max.y:
		win_max_determined = win_max.x
		set_winsize(win_max_determined)
		#write to file the size
	if win_scale == 0:
		call_deferred(set_winsize(1))
	#Build the array for the window scales
	for i in range(1, win_max_determined+1):
		scale_array.append(i)
		print(scale_array)
	set_winsize(win_scale)
	
func _process(_delta):
	monitor = DisplayServer.window_get_current_screen()

func _input(_event):
	if Input.is_action_just_pressed("F4"):
		scale_index = (scale_index+1) % scale_array.size()
		print(scale_index,"  ",scale_array[scale_index])
		set_winsize(scale_array[scale_index])
		#write the last size to file.
		pass


##In basic, get these things done.
## Make it so the windows update size works and shows a 2x windows size.
