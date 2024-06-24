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
var keepback = 0
#How far away should she stop
#Fucking hate math.
# How fast Kale will follow the mouse
@onready var _active_speed = 0.0

#Collison stuff
#Fake gravity
# var On_Ground = true
# var Z = float(0)
# var Fake_Y = float(0)
# var True_Y = (20/Z) + (80/Fake_Y)
#Counts the State Macine's Update
### FORGET THIS 2d! INSTEAD
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")/100
#Her own hitbox
@onready var K_HitBox = get_node("K_HitBox")


#States go Berrr
enum KaleStates {
	Idle,
	Move,
	Jumping,
	Falling,
	Animate_Speical
}
var currentState = KaleStates.Idle
var prevState = str("")
var UpdateCount = 0

func _ready() -> void:
#IF there is no focus, set focus to Marker
	if Focus == null:
		Focus = $Marker

func _physics_process(_delta):
	if K_Debug == true:
		print(velocity.y)
		
	velocity.y += (gravity/10)

	#State Machine 2
	#print(self.position)
	match currentState:
		KaleStates.Move:
			move()
		KaleStates.Idle:
			idle()
		KaleStates.Falling:
			pass
		KaleStates.Jumping:
			pass
		KaleStates.Animate_Speical:
			_Animate_Speical()

	if is_on_floor() and !KaleStates.Jumping:
		velocity.y = 0

	move_and_slide()

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
	if K_Debug:
		print("Position: ", self.position)
	if self.position.distance_to(Focus.position) > keepback:
		direction = (Focus.position - self.position).normalized()
		if K_Debug:
			print(direction)
		velocity = direction * FOLLOWSPEED
		move_and_slide()

func _Animate_Speical():
	#Ment to animated for various diffrent but uniqe things maybe
	pass


#collision stuff

func Jump():
	#overlapping bodies
	#if TopCol.position.y >= FloorCol.position.y:
	pass


func _on_k_shadow_body_exited(body:Node2D) -> void:
	change_state(KaleStates.Jumping)

	pass # Replace with function body.
