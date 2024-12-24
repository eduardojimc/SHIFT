extends Node2D
class_name enemyBase

var hitStunOn=false

var gravity=ProjectSettings.get_setting("physics/2d/default_gravity")
export var knockbackModifier :float
export var health:float
export var stunTimerTime :float
onready var stunTimer = $hitStunTimer


func physis():
	applyGravity()

func applyGravity():
	pass

func damageCalculation(damage,modifer):
	if(hitStunOn==false):
		print(health)
		health-=(damage*modifer)
		print(health)
		hitStun()

func hitStun():
	hitStunOn=true
	$hitStunTimer.start()

func resetStun():
	hitStunOn=false

func _on_hitStunTimer_timeout():
	resetStun()
