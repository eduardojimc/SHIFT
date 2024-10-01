extends Node2D

signal zeroHP
onready var hpBar= $hpBar

func barManager():
	if(hpBar.value==0):
		emit_signal("zeroHP")

func healthChange():
	pass
