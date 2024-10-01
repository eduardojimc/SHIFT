extends KinematicBody2D

var gravity= ProjectSettings.get_setting("physics/2d/default_gravity")*4
export var friction=750
var direction=1

enum states{idle,running,jumping,falling,dashing}
var currentState=states.idle
var lastState=states.idle

var velocity=Vector2.ZERO 
var inputVector=Vector2.ZERO
export var jumpMax=-200
export var Speed=170
var speedModifier=1
var jumpTrue:bool
onready var jumpCooldownTimer=$fallJumpTimer
onready var jumpTimer=$jumpTimer
export var jumpingTime:float
export var jumpingCooldownTime:float
export var maxHP=100

onready var dashTimer=$dashTimer
export var dashingTime:float
var dashTrue=true
export var dashModifier=2
func _ready():
	if(is_on_floor()):jumpTrue=true
	else:jumpTrue=false
	
	$barManager/hpBar.max_value= maxHP
	jumpTimer.wait_time=jumpingTime
	jumpCooldownTimer.wait_time=jumpingCooldownTime
	dashTimer.wait_time=dashingTime

func _physics_process(delta):
	print(direction)
	$barManager.barManager()
	flip()
	animationHandler()
	stateDebug(true)
	match currentState:
		states.idle:idleAction(delta)
		states.running:runningAction(delta)
		states.jumping:jumpingAction(delta)
		states.falling:fallingAction(delta)
		states.dashing:dashingAction(delta)
	move_and_slide(velocity,Vector2.UP)

func idleAction(delta):
	velocity.x=move_toward(velocity.x ,0,friction*delta)
	if(Input.is_action_just_pressed("dashing")):
		changeState(states.dashing,1)
		dashTimer.start()
	if(not is_on_floor()):
		changeState(states.falling,1)
	if(Input.is_action_just_pressed("jump") and jumpTrue==true):
		$jumpTimer.start()
		changeState(states.jumping,1)
	if(Input.is_action_pressed("ui_left")or Input.is_action_pressed("ui_right")):
		changeState(states.running,1)

func runningAction(delta):
	if(Input.is_action_just_pressed("dashing")):
		changeState(states.dashing,1)
		dashTimer.start()
	
	if(is_on_floor() and Input.is_action_just_pressed("jump")and jumpTrue==true):
		$jumpTimer.start()
		changeState(states.jumping,1)
	if(not is_on_floor()):
		changeState(states.falling,1)
		$jumpTimer.start()
	if(Input.is_action_just_released("ui_left")or Input.is_action_just_released("ui_right")):
		changeState(states.idle,1)
	movement(1)

func jumpingAction(delta):
	velocity.y=jumpMax
	if(jumpTrue==false):
		if(is_on_floor()):
			changeState(states.idle,1)
			velocity.y=20
		if(not is_on_floor()):
			changeState(states.falling,1)
			$fallJumpTimer.start()
			velocity.y=10
	movement(1.15)
	if(Input.is_action_just_released("jump")):
		jumpTrue=false


func fallingAction(delta):
	if(inputVector.x==0):
		velocity.x=move_toward(velocity.x ,0,friction*delta)
	if(jumpTrue==true and Input.is_action_just_pressed("jump")):
		changeState(states.jumping,1)
		$jumpTimer.start()
	movement(1.25)
	if(is_on_floor()):
		changeState(states.idle,1)
		velocity.y=0
	gravity(1,delta)

func dashingAction(delta):
	if(not is_on_floor()):
		gravity(1,delta)
	
	velocity.x=direction*Speed*dashModifier
	if(Input.is_action_just_released("dashing") or dashTrue==false):
		if(inputVector.x==0):
			changeState(states.idle,1)
			dashTimer.stop()
			dashTrue=true
		if(inputVector.x==1 or inputVector.x==-1):
			changeState(states.running,1)
			dashTimer.stop()
			dashTrue=true
	if(Input.is_action_just_pressed("jump")and jumpTrue==true):
		$jumpTimer.start()
		changeState(states.jumping,2)
		dashTimer.stop()
		dashTrue=true

func flip():
	inputVector.x=Input.get_action_raw_strength("ui_right")-Input.get_action_raw_strength("ui_left")
	if(Input.is_action_just_pressed("ui_left")):
		direction=-1
		$playerCenter.scale.x=1
	if(Input.is_action_just_pressed("ui_right")):
		direction=1
		$playerCenter.scale.x=-1
	
	if(Input.is_action_just_released("ui_left")and Input.is_action_pressed("ui_right")):
		direction=1
		$playerCenter.scale.x=-1
	
	if(Input.is_action_just_released("ui_right")and Input.is_action_pressed("ui_left")):
		direction=-1
		$playerCenter.scale.x=1

func changeState(newState,bonusSpeed):
	lastState=currentState
	currentState=newState
	speedModifier=bonusSpeed

func gravity(value,delta):
	velocity.y+=gravity*value*delta

func movement(value):
	if(Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")):
		velocity.x=Speed*direction*value*speedModifier
	if(Input.is_action_just_released("ui_left")or Input.is_action_just_released("ui_right")):
		velocity.x=0

func animationHandler():
	match currentState:
		states.idle:$playerAnimation.play("IDLEanim")
		states.falling:$playerAnimation.play("FALLINGanim")
		states.jumping:$playerAnimation.play("JUMPINGanim")
		states.running:$playerAnimation.play("RUNNINGanim")
		states.dashing:$playerAnimation.play("DASHINGanim")

func stateDebug(on:bool):
	if(on==true):
		match currentState:
			states.idle:$RichTextLabel.text="idle"
			states.running:$RichTextLabel.text="running"
			states.jumping:$RichTextLabel.text="jumping"
			states.falling:$RichTextLabel.text="falling"
			states.dashing:$RichTextLabel.text="dashing"

func _on_jumpTimer_timeout():
	jumpTrue=false

func _on_jumpBox_body_entered(body):
	jumpTrue=true

func _on_fallJumpTimer_timeout():
	jumpTrue=false

func _on_dashTimer_timeout():
	dashTrue=false


#func _on_barManager_placeHolderDamageSignal(printThing):
#	print(printThing)
