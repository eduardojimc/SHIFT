extends KinematicBody2D

############load&setting############
var projectile= preload("res://scenes/projectile.tscn") 
var custScreenScene=preload("res://scenes/cust.tscn")
var gravity= ProjectSettings.get_setting("physics/2d/default_gravity")*4
onready var dashTimer=$dashTimer
onready var jumpCooldownTimer=$fallJumpTimer
onready var jumpTimer=$jumpTimer
############movement logic############
var velocity=Vector2.ZERO 
var inputVector=Vector2.ZERO
export var friction=750
var direction=1
export var Speed=170
var speedModifier=1
############state############
enum states{idle,running,jumping,falling,dashing}
var currentState=states.idle
var lastState=states.idle
############jump############
export var jumpMax=-200
var jumpTrue:bool
export var jumpingTime:float
export var jumpingCooldownTime:float
############dash############
export var dashingTime:float
export var dashModifier=2

var custScreenActive=false

export var maxHP=100
var dashTrue=true

var activeWeapon= 1
var hand=["10000","10000","10000","10000","10000",]

var DeckMaster=[
	"10004",
	"10005",
	"10004",
	"10003",
	"10003",
	"10005",
	"10006",
	"10005",
	"10005",
	"10005",
	"10005",
	"10005",
	"10004",
	"10004",
	"10003",
	"10002",
	"10001",
	"10001",
	"10000",
	"10000",
	"10000",
]
var activeDeck:Array
var handSelect=["10000","10000","10000","10000","10000","10000","10000","10000",]

func _ready():
	Engine.set_target_fps(Engine.get_iterations_per_second())
	if(is_on_floor()):jumpTrue=true
	else:jumpTrue=false
	$barManager/hpBar.max_value= maxHP
	jumpTimer.wait_time=jumpingTime
	jumpCooldownTimer.wait_time=jumpingCooldownTime
	dashTimer.wait_time=dashingTime

func _physics_process(delta):	
	cardSelect()
	$barManager.barManager(delta)
	flip()
	animationHandler()
	$debug.stateDebug(true)
	match currentState:
		states.idle:idleAction(delta)
		states.running:runningAction(delta)
		states.jumping:jumpingAction(delta)
		states.falling:fallingAction(delta)
		states.dashing:dashingAction(delta)
	
	shoot(200,20)
	
	move_and_slide(velocity,Vector2.UP)

func idleAction(delta):
	custLoad()
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

func runningAction(_delta):
	if(Input.is_action_just_pressed("dashing")):
		changeState(states.dashing,1)
		dashTimer.start()
	
	if(is_on_floor() and Input.is_action_just_pressed("jump")and jumpTrue==true):
		$jumpTimer.start()
		changeState(states.jumping,1)
	if(not is_on_floor()):
		changeState(states.falling,1)
		$jumpTimer.start()
	if(Input.is_action_just_released("ui_left")or Input.is_action_just_released("ui_right"))and inputVector.x==0:
		changeState(states.idle,1)
	movement(1)

func jumpingAction(_delta):
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
	if(Input.is_action_just_released("jump")or is_on_ceiling()):
		jumpTrue=false

func fallingAction(delta):
	if(inputVector.x==0):
		velocity.x=move_toward(velocity.x ,0,friction*delta)
	if(jumpTrue==true and Input.is_action_just_pressed("jump")):
		changeState(states.jumping,1)
		$jumpTimer.start()
	movement(1.25)
	if(is_on_floor()):
		jumpTrue=true
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

func _on_jumpTimer_timeout():
	if( not is_on_floor()):
		jumpTrue=false

func _on_jumpBox_body_entered(_body):
	jumpTrue=true

func _on_fallJumpTimer_timeout():
	jumpTrue=false

func _on_dashTimer_timeout():
	dashTrue=false

func shoot(speed,damage):
	
	if(Input.is_action_just_pressed("SpecialShoot")and not hand[activeWeapon]=="10000" ):
		var proj = projectile.instance()
		get_parent().add_child(proj)
		proj.position = $playerCenter/range.global_position
		proj.velocity.x=200*direction
	
	if(Input.is_action_just_pressed("regularShoot")):
		var proj = projectile.instance()
		get_parent().add_child(proj)
		proj.position = $playerCenter/range.global_position
		proj.type= "regular"

func custLoad():
	if (Input.is_action_just_pressed("cust") and $barManager.custLoading==false):
		custScreenActive=true
		$deckLogic.handLogicStartUp()
		$barManager/custBar.value=0
		$barManager.custLoading=true
		var custscreen = custScreenScene.instance()
		add_child(custscreen)
		custscreen.position= $playerCenter.global_position
		get_tree().set_deferred("paused",true)

func cardSelect():
	if(Input.is_action_just_pressed("LeftCardSelect")):
		if(activeWeapon>1):
			activeWeapon -=1
			print(activeWeapon)
		else:
			activeWeapon =5
			print(activeWeapon)

	if(Input.is_action_just_pressed("RightCardSelect")):
		if(activeWeapon<5):
			activeWeapon +=1
			print(activeWeapon)
		else:
			activeWeapon=1
			print(activeWeapon)
	$deckLogic.changeCurserLocation()

func _on_barManager_fullcust():
	print("custFull")
