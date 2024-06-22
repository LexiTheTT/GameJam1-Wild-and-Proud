extends CharacterBody2D


const FOLLOWSPEED = 30.0
# How fast Kale will follow the mouse

#States go Berrr
enum KaleStates {
	Idle,
	Move,
	Animate_Speical
}
var currentState = KaleStates.Idle

func _physics_process(delta):
	match currentState:
	
	move_and_slide()

func _Idle():
	#Just... hangin' around.
	pass
func _Move():
	#Moves towards the mouse
	pass
func _Animate_Speical():
	#Ment to animated for various diffrent but uniqe things maybe
	pass