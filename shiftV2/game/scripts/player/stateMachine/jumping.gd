extends Node

onready var jumpTimer=$jumpTimer
onready var player := $"../.."
onready var states = $"../..".states
export var jumpMax=-200
var ready:bool
export var jumpingTime:float
export var jumpingCooldownTime:float
var on=true

func action(delta):
	if(Input.is_action_just_released("jump")):
		on=false
	
	if(player.is_on_ceiling()):
		on=false
		player.velocity.y+=100
	
	if(on==false):
		jumpTimer.stop()
		if(player.is_on_floor()):
			player.changeState(states.idle)
			
			ready=true
			player.velocity.y=0
		else:
			player.changeState(states.falling)
			player.velocity.y+=50
			
		player.jumping.jumpTimer.stop()
	else:player.velocity.y=jumpMax
	player.movement(1,delta)


func activate():
	if(Input.is_action_just_pressed("jump") and player.jumping.ready==true):
		player.jumping.jumpTimer.start()
		player.changeState(states.jumping)
		player.jumping.on=true


func _on_jumpTimer_timeout():
	on=false
