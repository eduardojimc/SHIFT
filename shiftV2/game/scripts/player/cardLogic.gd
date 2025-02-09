extends Node2D

#var projectile= preload("res://scenes/projectile.tscn") 
#var custScreenScene=preload("res://scenes/cust.tscn")
#
#########cards#########
##var custScreenActive=false
##var activeWeapon= 1
##var hand=["10000","10000","10000","10000","10000",]
##var DeckMaster=[
##	"10004",
##	"10005",
##	"10004",
##	"10003",
##	"10003",
##	"10005",
##	"10006",
##	"10005",
##	"10005",
##	"10005",
##	"10005",
##	"10005",
##	"10004",
##	"10004",
##	"10003",
##	"10002",
##	"10001",
##	"10001",
##	"10000",
##	"10000",
##	"10000",
##]
##var activeDeck:Array
##var handSelect=["10000","10000","10000","10000","10000","10000","10000","10000",]
##
##func cardSelect():
##	if(Input.is_action_just_pressed("LeftCardSelect")):
##		if(activeWeapon>1):
##			activeWeapon -=1
##			print(activeWeapon)
##		else:
##			activeWeapon =5
##			print(activeWeapon)
##
##	if(Input.is_action_just_pressed("RightCardSelect")):
##		if(activeWeapon<5):
##			activeWeapon +=1
##			print(activeWeapon)
##		else:
##			activeWeapon=1
##			print(activeWeapon)
##	$deckLogic.changeCurserLocation()
#func shoot(speed,damage):
#
#	if(Input.is_action_just_pressed("SpecialShoot")and not hand[activeWeapon]=="10000" ):
#		var proj = projectile.instance()
#		get_parent().add_child(proj)
#		proj.position = $playerCenter/range.global_position
#		proj.velocity.x=200*direction
#
#	if(Input.is_action_just_pressed("regularShoot")):
#		var proj = projectile.instance()
#		get_parent().add_child(proj)
#		proj.position = $playerCenter/range.global_position
#		proj.type= "regular"
#
#func custLoad():
#	if (Input.is_action_just_pressed("cust") and $barManager.custLoading==false):
#		custScreenActive=true
#		$deckLogic.handLogicStartUp()
#		$barManager/custBar.value=0
#		$barManager.custLoading=true
#		var custscreen = custScreenScene.instance()
#		add_child(custscreen)
#		custscreen.position= $playerCenter.global_position
#		get_tree().set_deferred("paused",true)
#
#
#func _on_barManager_fullcust():
#	print("custFull")
