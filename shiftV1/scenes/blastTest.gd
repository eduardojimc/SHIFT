extends Area2D

var blastspeed
var direction
var charge
var maxPower
var objPlayer
var baseDamage=0
var damage

func _ready():
	objPlayer =get_node("../player")
	maxPower=objPlayer.stats.PShot.chargeTime
	global_transform=get_node("../player/PlayerCenter/blastSpawn").global_transform
	blastspeed=objPlayer.stats.PShot.speed
	direction=objPlayer.direction
	charge=objPlayer.stats.PShot.charge

func _physics_process(delta):
	position.x+=blastspeed*direction*delta
	
	if charge<(maxPower*0.33):
		damage=baseDamage*.75

	elif (maxPower*0.33)<charge and charge<(maxPower*0.73):
		damage=baseDamage
		scale=Vector2(2,2)

	elif charge>(maxPower*0.73):
		damage=baseDamage*1.25
		scale=Vector2(10,10)
	
	

func _on_blast_body_entered(body):
	
	queue_free()
