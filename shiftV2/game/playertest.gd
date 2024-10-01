extends KinematicBody2D

var velocity=Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	$AnimationPlayer.play("falling")
	
	velocity.y+=10
	
	move_and_slide(velocity,Vector2.UP)
