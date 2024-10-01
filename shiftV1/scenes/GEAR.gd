extends KinematicBody2D

var inputVector=1

var velocity= Vector2.ZERO

var gravity= ProjectSettings.get_setting("physics/2d/default_gravity")

var state=IDLE
var lastState=IDLE
enum{
	IDLE,
	JUMPING,
	FALLING
}



func _physics_process(delta):
	velocity.y=gravity
	
	
	
	
	
	match state:
		IDLE:
			idleAction()
		JUMPING:jumpingAction()
		FALLING:fallingAction()
	
	move_and_slide(velocity,Vector2.UP)

func idleAction():
	#print("idle")
	
	if(not is_on_floor()):
		pass
	
	

func jumpingAction():
	print("jumping")

func fallingAction():
	print("falling")


