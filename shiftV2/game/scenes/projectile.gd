extends KinematicBody2D

var projType= {
	"null":{
		"damage":20,
		"knockback":20,
		"velocityX":20,
		"velocityY":20,
		"sprite":null
	}
	,
	
	"neutralShotSmall":{
		"damage":20,
		"knockback":20,
		"velocityX":20,
		"velocityY":20,
	}
}

var  damage 
var velocity= Vector2.ZERO
var type=projType.null

func _ready():
	print(damage,velocity)

func _physics_process(delta):
	move_and_slide(velocity, Vector2.UP)
	
