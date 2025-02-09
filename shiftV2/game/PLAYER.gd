extends KinematicBody2D

export var friction=950
var speedModifier=1
var direction=1
export var Speed=170
var inputVector=Vector2.ZERO
export var velocity:Vector2
enum states{idle,running,jumping,falling,dashing}
var currentState= states.idle
var lastState=states.idle
var blur = preload("res://testBlur.material")
var normal = preload("res://testNormal.material")

onready var playerAnimation :=$playerAnimation
onready var playerCenter :=$playerCenter


onready var idle := $stateMachine/idle
onready var running := $stateMachine/running
onready var jumping := $stateMachine/jumping
onready var falling := $stateMachine/falling
onready var dashing := $stateMachine/dashing

func _ready():
	Engine.set_target_fps(Engine.get_iterations_per_second())
	if(is_on_floor()):
		jumping.ready= true
	else:
		jumping.ready= false


func _physics_process(delta):
	match currentState:
		states.idle : $stateMachine/idle.action(delta)
		states.running : $stateMachine/running.action(delta)
		states.jumping : $stateMachine/jumping.action(delta)
		states.falling : $stateMachine/falling.action(delta)
		states.dashing : $stateMachine/dashing.action(delta)
	flip()
	animationHandler()
	move_and_slide( velocity, Vector2.UP )

func changeState(newState):
	lastState = currentState
	currentState=newState
	print(states.keys()[lastState]  , "---->", states.keys()[currentState])

func animationHandler():
	match currentState:
		states.idle:$playerAnimation.play("IDLEanim")
		states.falling:$playerAnimation.play("FALLINGanim")
		states.jumping:$playerAnimation.play("JUMPINGanim")
		states.running:$playerAnimation.play("RUNNINGanim")
		states.dashing:$playerAnimation.play("DASHINGanim")

func movement(value,delta):
	if(Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")):
		if(lastState==states.dashing):
			velocity.x=move_toward(velocity.x, Speed*direction*value*speedModifier,friction*delta)
			print(move_toward(velocity.x, Speed*direction*value*speedModifier,friction*delta))
		else:
			velocity.x=Speed*direction*value*speedModifier
	if(Input.is_action_just_released("ui_left")or Input.is_action_just_released("ui_right")):
		velocity.x=0

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
