extends Node


var deck=[
	
]

var avaliableDeck=deck

var usedDeck=[
	
]

var selectedhand=0
var currenthand=[
	{
		"ID":0,
		"name":"TEST1",
		"energyValue":10,
		"energyMax":20
	}
	,
	{
		"ID":0,
		"name":"none",
		"energyValue":4,
		"energyMax":10
	}
	,
	{
		"ID":0,
		"name":"none",
		"energyValue":8,
		"energyMax":10
	}
	,
	{
		"ID":0,
		"name":"none",
		"energyValue":20,
		"energyMax":10
	}
	,
	{
		"ID":0,
		"name":"none",
		"energyValue":5,
		"energyMax":10
	}
]

func _ready():
	$curserSmall/AnimationPlayer.play("curser2")
	$custMenue/curserSmall/AnimationPlayer.play("curser1")


func _physics_process(delta):
	cardIconManager()
	cust()


###############################################################################
func cardEnergyBar(cardObject,handID):
	cardObject.value = currenthand[handID].energyValue
func cardEnergyBarManager():
	cardEnergyBar($CARDicon/TextureProgress,0)
	cardEnergyBar($CARDicon2/TextureProgress,1)
	cardEnergyBar($CARDicon3/TextureProgress,2)
	cardEnergyBar($CARDicon4/TextureProgress,3)
	cardEnergyBar($CARDicon5/TextureProgress,4)
	###########################################################################
	setMax($CARDicon/TextureProgress,0)
	setMax($CARDicon2/TextureProgress,1)
	setMax($CARDicon3/TextureProgress,2)
	setMax($CARDicon4/TextureProgress,3)
	setMax($CARDicon5/TextureProgress,4)
func setMax(cardObject,handID):
	cardObject.max_value = currenthand[handID].energyMax
###############################################################################
func handSelectManager():
	if(Input.is_action_just_pressed("cardLeft")):
		selectedhand-=1
		if(selectedhand==-1):
			selectedhand=5
		curserLocationManager()
	if(Input.is_action_just_pressed("cardRight")):
		selectedhand+=1
		if(selectedhand==6):
			selectedhand=0
		curserLocationManager()
	print(selectedhand)
func curserLocation(selectHand,cardObject):
	if(selectedhand==selectHand):
		$curserSmall.global_position = cardObject.global_position
func curserLocationManager():
	curserLocation(0,$CARDicon)
	curserLocation(1,$CARDicon2)
	curserLocation(2,$CARDicon3)
	curserLocation(3,$CARDicon4)
	curserLocation(4,$CARDicon5)
##############################################################################
func cardIcon(cardObject,handID):
	cardObject.play(currenthand[handID].name)
func cardIconManager():
	cardIcon($CARDicon/AnimationPlayer,0)
	cardIcon($CARDicon2/AnimationPlayer,1)
	cardIcon($CARDicon3/AnimationPlayer,2)
	cardIcon($CARDicon4/AnimationPlayer,3)
	cardIcon($CARDicon5/AnimationPlayer,4)
##############################################################################

var selectedCust=Vector2.ZERO
onready var custCurser=$custMenue/curserSmall

func cust():
	if($custMenue.visible==true):
		custCurserLocation()
		
func custCurserLocation():
	
	if(Input.is_action_just_pressed("ui_left")):
		selectedCust.x-=1
		custBounds()
	if(Input.is_action_just_pressed("ui_right")):
		selectedCust.x+=1
		custBounds()
	if(Input.is_action_just_pressed("ui_up")):
		selectedCust.y+=1
		custBounds()
	if(Input.is_action_just_pressed("ui_down")):
		selectedCust.y-=1
		custBounds()
	

	
	
	
	print(selectedCust)
	
	match selectedCust:
		Vector2(0,0):custCurser.global_position=$custMenue/CARDicon.global_position
		Vector2(1,0):custCurser.global_position=$custMenue/CARDicon2.global_position
		Vector2(2,0):custCurser.global_position=$custMenue/CARDicon3.global_position
		Vector2(3,0):custCurser.global_position=$custMenue/CARDicon4.global_position
		Vector2(4,0):custCurser.global_position=$custMenue/CARDicon5.global_position
		#############################################################################################
		Vector2(0,-1):custCurser.global_position=$custMenue/CARDicon6.global_position
		Vector2(1,-1):custCurser.global_position=$custMenue/CARDicon7.global_position
		Vector2(2,-1):custCurser.global_position=$custMenue/CARDicon8.global_position
		Vector2(3,-1):custCurser.global_position=$custMenue/CARDicon9.global_position
		Vector2(4,-1):custCurser.global_position=$custMenue/CARDicon10.global_position
		#############################################################################################
		Vector2(5,0):custCurser.global_position=$custMenue/CARDicon11.global_position
		Vector2(5,-1):custCurser.global_position=$custMenue/CARDicon12.global_position
		Vector2(5,-2):custCurser.global_position=$custMenue/CARDicon13.global_position
		Vector2(5,-3):custCurser.global_position=$custMenue/CARDicon14.global_position
		Vector2(5,-4):custCurser.global_position=$custMenue/CARDicon15.global_position
		#############################################################################################
		Vector2(6,0):custCurser.global_position=$custMenue/OK.global_position


func custBounds():
	
	if(selectedCust.x==-1):
		selectedCust=Vector2(6,0)
	
	if(selectedCust.x==7):
		selectedCust=Vector2(0,0)
	
	if(selectedCust.x>-1 and selectedCust.x<5):
		if(selectedCust.y==1):
			selectedCust.y=-1
		if(selectedCust.y==-2):
			selectedCust.y=0
	
	if(selectedCust.x==5):
		if(selectedCust.y==1):
			selectedCust.y=-4
		if(selectedCust.y==-5):
			selectedCust.y=0
	
	if(selectedCust.x==6):
		selectedCust.y=0
	
	if(selectedCust.x==4 and selectedCust.y<-2):
		selectedCust.y=-1




#func curserLocationManager
#func
