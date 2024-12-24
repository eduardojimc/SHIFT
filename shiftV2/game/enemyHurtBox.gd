extends Area2D

onready var enemy=get_parent()
export var damageModifer :float
signal sendIncomingDamage(damage,damageModifer)

func _on_enemyHurtBox_area_entered(area):
	enemy.damageCalculation(area.damage,damageModifer)
