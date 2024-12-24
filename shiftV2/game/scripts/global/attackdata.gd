extends Node

var attackData

func _ready():
	var itemmeta_file = File.new()
	itemmeta_file.open("res://scripts/global/attacks.json", File.READ)
	var itemmeta_json = JSON.parse(itemmeta_file.get_as_text())
	itemmeta_file.close()
	attackData=itemmeta_json.result
#	print (attackData["10001"]["ID"])
	

