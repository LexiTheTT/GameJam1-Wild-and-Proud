extends CharacterBody2D

#Exports
@export var K_Debug = bool(false)

#Focus stuff
@export var Focus: Node2D
var Focus_distance = 0.0
var direction = Vector2().normalized()
#
var FOLLOWSPEED = 50.0
#
var keepback = 30
#How far away should she stop
#Fucking hate math.
# How fast Kale will follow the mouse
@onready var _active_speed = 0.0

#Collison stuff
var Z = float(0)
#Fake gravity
var True_Y = float(0)
#Counts the State Macine's Update

#States go Berrr
enum KaleStates {
	Idle,
	Move,
	Animate_Speical
}
var currentState = KaleStates.Idle
var prevState = str("")
var UpdateCount = 0

func _ready() -> void:
	change_state(KaleStates.Move)

func _physics_process(_delta):
	if K_Debug == true:
		#Here we'll show the debug info that might help a lot.
		pass
	# _active_speed = sqrt((velocity.x**2) / (velocity.y**2))
	# print(_active_speed)
	# Y floor =
	#State Machine 2
	print(self.position)
	match currentState:
		KaleStates.Move:
			move()
		KaleStates.Idle:
			idle()
		KaleStates.Animate_Speical:
			_Animate_Speical()

func change_state(newState = KaleStates.Idle):
# A function for changing states.
	prevState = currentState
	currentState = newState
	if prevState == currentState:
	#Should be, if same, don't do shit. I don't wanna spam incase of other debug info.
			UpdateCount += 1
			if K_Debug == true:
				print(UpdateCount,":","Prev: ", KaleStates.keys()[prevState], "	|  Current:", KaleStates.keys()[newState])

func idle():
	#Just... hangin' around.
	pass

func move():
	#Moves towards the focus
	#currently doesn't work. I need to sleep.
	print("Position: ", self.position)
	if self.position.distance_to(Focus.position) > keepback:
		direction = (Focus.position - self.position).normalized()
		print(direction)
		velocity = direction * FOLLOWSPEED
		move_and_slide()

func _Animate_Speical():
	#Ment to animated for various diffrent but uniqe things maybe
	pass


#collision stuff

func fakeJump():
	#overlapping bodies
	#if TopCol.position.y >= FloorCol.position.y 
	pass
