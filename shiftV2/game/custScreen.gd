extends Node2D



onready var player= get_parent()

func _ready():
	changeIcons()
	

func _physics_process(delta):
	pass


func changeIcons():
	print(player.handSelect)
	player.handSelect[0]="10003"
	$CanvasLayer/handOption/attackicons/AnimationPlayer.play(player.handSelect[0])
	$CanvasLayer/handOption/attackicons2/AnimationPlayer.play(player.handSelect[1])
	$CanvasLayer/handOption/attackicons3/AnimationPlayer.play(player.handSelect[2])
	$CanvasLayer/handOption/attackicons4/AnimationPlayer.play(player.handSelect[3])
	$CanvasLayer/handOption/attackicons5/AnimationPlayer.play(player.handSelect[4])
	$CanvasLayer/handOption/attackicons6/AnimationPlayer.play(player.handSelect[5])
	$CanvasLayer/handOption/attackicons7/AnimationPlayer.play(player.handSelect[6])
	$CanvasLayer/handOption/attackicons8/AnimationPlayer.play(player.handSelect[7])
