extends enemyBase

func _ready():
	stunTimer.wait_time=stunTimerTime

func _physics_process(delta):
	physis()
	
