extends Node2D
onready var player= get_parent()

#func _ready():
#	player.activeDeck=player.DeckMaster
#	print(player.activeDeck)
#	player.activeDeck.shuffle()
#	$"../hand/attackicons/AnimationPlayer".play(player.hand[0])
#	$"../hand/attackicons2/AnimationPlayer".play(player.hand[1])
#	$"../hand/attackicons3/AnimationPlayer".play(player.hand[2])
#	$"../hand/attackicons4/AnimationPlayer".play(player.hand[3])
#	$"../hand/attackicons5/AnimationPlayer".play(player.hand[4])
#	$"../hand/curser/AnimationPlayer".play("curserloopOn")
#
#
#
#func handLogicStartUp():
#	player.handSelect[0]=player.activeDeck[0]
#	player.handSelect[1]=player.activeDeck[1]
#	player.handSelect[2]=player.activeDeck[2]
#	player.handSelect[3]=player.activeDeck[3]
#	player.handSelect[4]=player.activeDeck[4]
#	player.handSelect[5]=player.activeDeck[5]
#	player.handSelect[6]=player.activeDeck[6]
#	player.handSelect[7]=player.activeDeck[7]
#
#	player.activeDeck.remove(0)
#	player.activeDeck.remove(1)
#	player.activeDeck.remove(2)
#	player.activeDeck.remove(3)
#	player.activeDeck.remove(4)
#	player.activeDeck.remove(5)
#	player.activeDeck.remove(6)
#	player.activeDeck.remove(7)
#
#
#
#func changeCurserLocation():
#	match player.activeWeapon:
#		1:$"../hand/curser".global_position=$"../hand/attackicons".global_position
#		2:$"../hand/curser".global_position=$"../hand/attackicons2".global_position
#		3:$"../hand/curser".global_position=$"../hand/attackicons3".global_position
#		4:$"../hand/curser".global_position=$"../hand/attackicons4".global_position
#		5:$"../hand/curser".global_position=$"../hand/attackicons5".global_position
#
