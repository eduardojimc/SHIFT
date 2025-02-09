extends Node

var gravity= ProjectSettings.get_setting("physics/2d/default_gravity")*4

onready var player := $"../.."
onready var states = $"../..".states

func action(delta):
	player.movement(1.2,delta)
	if(player.is_on_floor()):
		player.jumping.ready=true
		print(player.inputVector)
		if(player.inputVector.x==0):
			player.changeState(states.idle)
		else:
			player.changeState(states.running)
		player.velocity.y=0
	
	if(Input.is_action_pressed("ui_down")):
		applyGravity(delta,5)
	else:
		applyGravity(delta,2)
	

func applyGravity(delta,bonus):
	player.velocity.y+=gravity*bonus*delta

