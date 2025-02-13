extends Node


onready var player := $"../.."
onready var states = $"../..".states


func action(delta):
	player.velocity.x  =move_toward(player.velocity.x ,0,player.friction*delta)
	if(not player.is_on_floor()):
		player.changeState(states.falling)
	if(Input.is_action_pressed("ui_left")or Input.is_action_pressed("ui_right")):
		player.changeState(states.running)
	player.jumping.activate()
	
	if(Input.is_action_just_pressed("dashing")):
		player.dashing.activate()
