extends Node


onready var player := $"../.."
onready var states = $"../..".states

func action(delta):
	if(player.inputVector.x==0 and not ( Input.is_action_pressed("ui_left")or Input.is_action_pressed("ui_right")  )  ):
		player.changeState(states.idle)
	
	if(not player.is_on_floor()):
		player.changeState(states.falling)
	if(Input.is_action_just_pressed("dashing")):
		player.dashing.activate()
	player.movement(1,delta)
	player.jumping.activate()
