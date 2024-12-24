extends Node
class_name finiteStateMachine

var states ={null:"$null"}
var currentState
export var initalState:String

func _ready():
	for child in get_children():
		if(child is state):
			states[child.name.to_lower()] = child 
#	print(states[0])
	


#func _physics_process(delta):
##	print(states)
#	if(Input.is_action_just_pressed("jump")):
#		$walking.enter()
	
#	currentState.update()
