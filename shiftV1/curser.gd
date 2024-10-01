extends KinematicBody2D

var inputVector= Vector2.ZERO
var velocity=Vector2.ZERO
var speed=80
var friction=50

func _physics_process(delta):
	move(delta)
	print(inputVector)
	move_and_slide(velocity,Vector2.UP)
func move(delta):
	inputVector.x=Input.get_action_raw_strength("ui_right")-Input.get_action_raw_strength("ui_left")
	inputVector.y=Input.get_action_raw_strength("ui_up")-Input.get_action_raw_strength("ui_down")
	velocity.x+=inputVector.x*speed*delta
	velocity.y-=inputVector.y*speed*delta
	velocity.y=move_toward(velocity.y,0,friction*delta)
	velocity.x=move_toward(velocity.x,0,friction*delta)

