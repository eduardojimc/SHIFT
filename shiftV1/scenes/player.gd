extends KinematicBody2D

var velocity =Vector2.ZERO
var inputVector=Vector2.ZERO

var gravity= ProjectSettings.get_setting("physics/2d/default_gravity")

var speed= 75
var jumpStrength=200


func _physics_process(delta):
	velocity.y=gravity*1.5
	inputVector.x=Input.get_action_raw_strength("ui_right")-Input.get_action_raw_strength("ui_left")
	velocity.x=inputVector.x*speed
	
	print(inputVector)
	print(velocity)
	move_and_slide(velocity,Vector2.UP)











##var currentstate=GROUNDED
##var lastState=GROUNDED
##
##var stats={
##	"speed":100,
##	"jump":{
##		"timer":1,
##		"strength":100,
##		"rate":1,
##		"value":0
##	}
##}
#
#
#enum {
#	GROUNDED,
#	RUNNING,
#	JUMPING,
#	FALLING
#}
#
#func _physics_process(delta):
#	velocity.y+=gravity
#	inputVector.x=Input.get_action_raw_strength("ui_right")-Input.get_action_raw_strength("ui_left")
#	match currentstate:
#		GROUNDED:groundedAction();
#		RUNNING:runningAction();
#		JUMPING:jumpingAction(delta);
#		FALLING:fallingAction();
#
#	move_and_slide(velocity,Vector2.UP)
#
#func groundedAction():
#	if(not inputVector.x==0):
#		changeState(RUNNING)
#
#	if(not is_on_floor()):
#		changeState(FALLING)
#
#	if(Input.is_action_just_pressed("jump")):
#		changeState(JUMPING)
#
#
#
#
#	print("grounded")
#
#func runningAction():
#	velocity.x=inputVector.x*stats.speed
#	if(inputVector.x==0):
#		changeState(GROUNDED)
#
#	if(Input.is_action_just_pressed("jump")):
#		changeState(JUMPING)
#
#
#
#	print("running")
#
#func jumpingAction(delta):
#
#
#
##	if(is_on_floor() and inputVector.x==0 and not Input.is_action_pressed("jump")):
##		velocity.x=0
##		stats.jump.value=stats.jump.timer
##		changeState(GROUNDED)
##
##	if(is_on_floor() and not inputVector.x==0 and not Input.is_action_pressed("jump")):
##		velocity.x=0
##		stats.jump.value=stats.jump.timer
##		changeState(RUNNING)
##	if(not is_on_floor() and not Input.is_action_pressed("jump")):
##		changeState(FALLING)
##	if(stats.jump.value==0):
##		changeState(FALLING)
##
##
##	velocity.x=inputVector.x*stats.speed
##	velocity.y=-stats.jump.strength
##	stats.jump.value= move_toward(stats.jump.value,0,stats.jump.rate*delta)
##	#+gravity
##
##	print("jumping",stats.jump.timer)
#
#func fallingAction():
#	if(is_on_floor()):
#		changeState(GROUNDED)
#
#
#
#
#
#
#	print("falling")
#
#
#
#
#
#
#
#
#
#
#
##	if(Input.is_action_just_pressed("jump")):
##		changeState(JUMPING)
##
##	if(not is_on_floor()):
##		changeState(FALLING)
#
#
#
##
##func jumpingAction():
##	print("jumping")
##	if(is_on_floor()):
##
##	if(Input.is_action_just_released("jump")or ):
##		changeState(FALLING)
##
##func FallingAction():
##	print("falling")
#
#func changeState(newState):
#	lastState=currentstate
#	currentstate=newState
#
#
#
##func ():
##	pass
##
##func ():
##	pass
#
#
#
#		#JUMPING:jumpingAction();
#		#FALLING:FallingAction();
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
##
##
##
##
##
##
##
##
##
##
##
##
##
###################onreadyLoad###########################
##onready var animPlayer=$AnimationPlayer # load animation player node
##onready var healthBar=$CanvasLayer/UI/Health #load health bar node
##onready var MPbar=$CanvasLayer/UI/MP #load MP bar node
##onready var custBar=$CanvasLayer/UI/cust #load custom gague bar node
##onready var gravity =ProjectSettings.get_setting("physics/2d/default_gravity") #sets gavity variable
###onready var cardController=$CanvasLayer/cardController 
###################onreadyLoad###########################
###################variables###########################
##var inputVector= Vector2.ZERO
##var velocity= Vector2.ZERO
##
##var stats={
##	"speed":64,
##
##	"jump":{
##		"hight":250,
##		"rate":100,
##		"timerRate":1,
##		"timerMax":2,
##		"on":true
##	},
##
##	"hp":1,
##	"mp":1,
##}
###################variables###########################
###################states###########################
##enum {IDLE,JUMPING,FALLING,IFRAME}
##var currentState=IDLE
##var lastState=IDLE
###################states###########################
##
##
##func _ready():
##	pass
##
##func _physics_process(delta):
##	if(Input.is_action_just_pressed("custMenue")):
##		custTrigger()
##	barUpdate()
##
##	
##	match currentState:
##		IDLE:idleAction(delta);
##		JUMPING:jumpingAction(delta);
##		FALLING:fallingAction(delta);
##
##	move_and_slide(velocity,Vector2.UP)
##
########################ACTIONS#######################################
##func idleAction(delta):
##	print("idle")
##	movement()
##	if(Input.is_action_just_pressed("jump") and stats.jump.on==true):
##		changeState(JUMPING)
##
##
##
##func jumpingAction(delta):
##	print("jumping",velocity.y)
##	#movement()
##	velocity.y=-(stats.jump.rate+gravity)
##
##	changeState(FALLING)
###	
##
###	#velocity.y=move_toward(velocity.y,-stats.jump.hight,stats.jump.rate*delta)
###	if(Input.is_action_just_released("jump")):
###		stats.jump.on=false
###		changeState(FALLING)
###
##
##
##
##
##func fallingAction(delta):
##	movement()
##	print("falling")
##	if(is_on_floor()):
##		stats.jump.on=true
##		changeState(IDLE)
########################ACTIONS#######################################
##
##func movement():
##	velocity.y=gravity
##	velocity.x=stats.speed*inputVector.x
##
##
##
##
##func custTrigger():
##	pass
##
##func barUpdate():
##	pass
##
##func changeState(newState):
##	currentState=lastState
##	currentState=newState
##
##
##
##
###var pShot=preload("res://scenes/blastTest.tscn")
##
###var stats={
###	"speed":{
###		"max":0,
###		"rate":100,
###	},
###	"jump":{
###		"on":false,
###		"rate":0,
###	},
###	"HP":{
###		"max":100,
###		"value":100,
###	},
###	"MP":{
###		"max":100,
###		"value":0,
###		"rate":1,
###	},
###	"CUST":{
###		"max":1000,
###		"value":0,
###		"rate":1,
###	},
###	"PShot":{
###		"damage":10,
###		"speed":300,
###		"charge":0,
###		"chargeRate":100,
###		"chargeTime":100,
###		"timer":100,
###		"timerMax":50,
###		"timerRate":200
###	}
###	}
###func _ready():
###	healthBar.max_value=stats.HP.max
###	healthBar.value=stats.HP.value
###	MPbar.max_value=stats.HP.max
###	MPbar.value=stats.MP.value
###	custBar.max_value=stats.CUST.max
###	custBar.value=stats.CUST.value
###	$CanvasLayer/UI/cardAnimation.play("New Anim")
###
###
###func _physics_process(delta):
###	if(Input.is_action_just_pressed("custMenue")):
###		$CanvasLayer/cardController/custMenue.visible=true
###		get_tree().paused=true
###
###
###	cardController.handSelectManager()
###	barUpdate(delta)
###	
###	cardManage()
###	cust()
###	match currentState: 
###		IDLE:idleAction(delta)
###		JUMPING:jumpingAction()
###		FALLING:fallingAction(delta)
###		IFRAME:iFrameAction()
###
###	neutralAttack(delta)
###	cardAttack()
###	move_and_slide(velocity,Vector2.UP)
###
###	#debugPrint()
###
###func idleAction(delta):
###
###	if(velocity.x==0):
###		animPlayer.play("idle")
###	else:
###		animPlayer.play("RUN")
###
###	moving()
###	if(Input.is_action_just_pressed("jump")):
###		changeState(JUMPING)
###	if(not is_on_floor()):
###		changeState(FALLING)
###	if(Input.is_action_just_pressed("debugkey")):
###		changeState(IFRAME)
###
###
###
###func jumpingAction():
###	velocity.y=-(stats.jump.rate+gravity)
###	if(is_on_floor()):
###		changeState(IDLE)
###	if(stats.jump.on==false):
###		changeState(FALLING)
###	if(Input.is_action_just_released("jump")):
###		stats.jump.on==false
###
###func fallingAction(delta):
###	moving()
###	if(velocity.y>0):
###		animPlayer.play("FALL")
###	else:
###		animPlayer.play("JUMP")
###
###	if(is_on_floor()):
###		changeState(IDLE)
###	velocity.y+=gravity*2*delta
###
###func damageCalc():
###	$CanvasLayer/UI/Health.value=stats.HP.value
###
###func moving():
###	flipCheck()
####	dash()
###	velocity.x=stats.speed.rate*inputVector.x
###
###func barUpdate(delta):
###	cardController.cardEnergyBarManager()
###	if(velocity.x!=0):
###		stats.MP.value+=stats.MP.rate*delta
###		stats.CUST.value+=stats.CUST.rate*delta
###	else:
###		stats.MP.value+=(stats.MP.rate*2)*delta
###		stats.CUST.value+=(stats.CUST.rate*2)*delta
###
###	$CanvasLayer/UI/cust.value=stats.CUST.value
###	$CanvasLayer/UI/MP.value=stats.MP.value
###
###func flipCheck():
###
###	if(inputVector.x==1):
###		direction=1
###	if(inputVector.x==-1):
###		direction=-1
###
###	if(direction<0):
###		$PlayerCenter.scale.x=-1
###	else:
###		$PlayerCenter.scale.x=1
###
###func debugPrint():
###	match currentState:
###		IDLE:print("idle", velocity, "animation", animPlayer.current_animation)
###		JUMPING:print("jumping",velocity, "animation", animPlayer.current_animation)
###		FALLING:print("falling", velocity, "animation", animPlayer.current_animation)
###		IFRAME:print("iframe", velocity, "animation", animPlayer.current_animation)
###
###func neutralAttack(delta):
###	stats.PShot.timer=move_toward(stats.PShot.timer,0,stats.PShot.timerRate*delta)
###
###	if(stats.PShot.timer==0):
###		if(Input.is_action_pressed("Pshot")):
###			stats.PShot.charge=move_toward(stats.PShot.charge,  stats.PShot.chargeTime,  stats.PShot.chargeRate*delta)
###		if(Input.is_action_just_released("Pshot")):
###			#if(inputVector.x==0 and is_on_floor()):
###			#	animPlayer.play("PSHOTidle")
###			shoot()
###
###
###func cardManage():
###	pass
####	$CanvasLayer/UI/CARDicon/AnimationPlayer.play(MasterScript.cardMasterList[handCards[0]].cardAnimation)
####	$CanvasLayer/UI/CARDicon2/AnimationPlayer.play(MasterScript.cardMasterList[handCards[1]].cardAnimation)
####	$CanvasLayer/UI/CARDicon3/AnimationPlayer.play(MasterScript.cardMasterList[handCards[2]].cardAnimation)
####	$CanvasLayer/UI/CARDicon4/AnimationPlayer.play(MasterScript.cardMasterList[handCards[3]].cardAnimation)
####	$CanvasLayer/UI/CARDicon5/AnimationPlayer.play(MasterScript.cardMasterList[handCards[4]].cardAnimation)
####
####	if(Input.is_action_just_pressed("cardLeft")):
####		selectedcard-=1
####
####	if(Input.is_action_just_pressed("cardRight")):
####		selectedcard+=1
####
####	if(selectedcard<1):
####		selectedcard=5
####	if(selectedcard>5):
####		selectedcard=1
#####
#####	if(Input.is_action_just_pressed("cardShot")):
#####		print(selectedcard,handCards[0])
#####
#####
####
####
####
####
####	elif(selectedcard==1):
####		$CanvasLayer/UI/cardSelect.global_position=$CanvasLayer/UI/CARDicon.global_position
####	elif(selectedcard==2):
####		$CanvasLayer/UI/cardSelect.global_position=$CanvasLayer/UI/CARDicon2.global_position
####	elif(selectedcard==3):
####		$CanvasLayer/UI/cardSelect.global_position=$CanvasLayer/UI/CARDicon3.global_position
####	elif(selectedcard==4):
####		$CanvasLayer/UI/cardSelect.global_position=$CanvasLayer/UI/CARDicon4.global_position
####	elif(selectedcard==5):
####		$CanvasLayer/UI/cardSelect.global_position=$CanvasLayer/UI/CARDicon5.global_position
###
###func cardAttack():
###	pass
###func cust():
###	pass
####	if(Input.is_action_just_pressed("custMenue")and stats.CUST.value==stats.CUST.max):
####
####
####		usedDeck.append_array(handCards)
####		handCards[0]= 0
####		handCards[1]= 0
####		handCards[2]= 0
####		handCards[3]= 0
####		handCards[4]= 0
####		stats.CUST.value==0
####		$CanvasLayer/UI/custMenue.visible=true
####		get_tree().paused =true
###
###func cardShoot():
###	#get_parent().add_child()
###	pass
###
###func shoot():
###	get_parent().add_child(pShot.instance())
###	stats.PShot.charge=0
###	stats.PShot.timer=stats.PShot.timerMax
###
###func dash():
###	pass
