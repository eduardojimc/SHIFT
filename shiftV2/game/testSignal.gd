extends Node

signal testSignal

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_down"):
		emit_signal("testSignal")
