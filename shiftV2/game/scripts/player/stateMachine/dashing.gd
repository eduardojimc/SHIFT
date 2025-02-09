extends Node


onready var player := $"../.."
onready var states = $"../..".states
onready var dashTimer=$dashTimer
export var dashingTime:float
export var dashModifier=2
export var maxHP=100
var dashTrue=true


func action(delta):
	if(not player.is_on_floor()):
		player.changeState(states.falling)
		player.dashing.dashTimer.stop()
	
	if(Input.is_action_just_released("dashing")):
		if(player.inputVector.x==0):
			player.changeState(states.idle)
			player.dashing.dashTimer.stop()
		else:
			player.changeState(states.running)
			player.dashing.dashTimer.stop()
	player.velocity.x = player.Speed *player.direction *player.speedModifier*dashModifier
	player.jumping.activate()

func activate():
	player.changeState(states.dashing)
	player.dashing.dashTimer.start()

func _on_dashTimer_timeout():
	if(player.inputVector.x==0):
		player.changeState(states.idle)
		player.dashing.dashTimer.stop()
	else:
		player.changeState(states.running)
		player.dashing.dashTimer.stop()
