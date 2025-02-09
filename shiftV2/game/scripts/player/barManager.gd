extends Node2D















#
#signal fullcust
#signal zeroHP
#onready var hpBar= $hpBar
#onready var custBar= $custBar
#var custRate =100
#var custRateModifer=1
#var custLoading= true
#
#func _physics_process(delta):
#	if(get_parent().custScreenActive==false):
#		custBar.value=move_toward(custBar.value,custBar.max_value,delta*custRate*custRateModifer)
#
#
#func barManager(delta):
#	if(hpBar.value==0):
#		emit_signal("zeroHP")
#	if(custBar.value==custBar.max_value and custLoading==true):
#		emit_signal("fullcust")
#		custLoading=false
#
#
#func healthChange():
#	pass
#
