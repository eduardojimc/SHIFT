extends Node2D


#var select=0

var select=Vector2.ZERO






func _ready():
	$custSelect/AnimationPlayer.play("New Anim")

func _physics_process(delta):
	
	if($".".visible==true):
		
		
		if(Input.is_action_just_pressed("ui_left")):
			select.x-=1
		if(Input.is_action_just_pressed("ui_right")):
			select.x+=1
		if(Input.is_action_just_pressed("ui_down")):
			select.y+=1
		if(Input.is_action_just_pressed("ui_up")):
			select.y-=1
		
		
		
		if(-1<select.x and select.x<5):
			if(select.y<0):
				select.y=1
			if(select.y>1):
				select.y=0
		
		if(select.x==5):
			if(select.y<0):
				select.y=4
			if(select.y>4):
				select.y=0
		
		
		if(select.x==6):
			select.y=0
		
		if(select.x==7):
			select.x=0
		
		if(select.x==-1):
			select.x=6
		
		
		
	match select:
		Vector2(0,0):$custSelect.global_position=$CARDicon.global_position
		Vector2(0,1):$custSelect.global_position=$CARDicon6.global_position
		Vector2(1,0):$custSelect.global_position=$CARDicon2.global_position
		Vector2(1,1):$custSelect.global_position=$CARDicon7.global_position
		Vector2(2,0):$custSelect.global_position=$CARDicon3.global_position
		Vector2(2,1):$custSelect.global_position=$CARDicon8.global_position
		Vector2(3,0):$custSelect.global_position=$CARDicon4.global_position
		Vector2(3,1):$custSelect.global_position=$CARDicon9.global_position
		Vector2(4,0):$custSelect.global_position=$CARDicon5.global_position
		Vector2(4,1):$custSelect.global_position=$CARDicon10.global_position
		
		Vector2(5,0):$custSelect.global_position=$CARDicon11.global_position
		Vector2(5,1):$custSelect.global_position=$CARDicon12.global_position
		Vector2(5,2):$custSelect.global_position=$CARDicon13.global_position
		Vector2(5,3):$custSelect.global_position=$CARDicon14.global_position
		Vector2(5,4):$custSelect.global_position=$CARDicon15.global_position
		Vector2(6,0):
			$custSelect.global_position=$OK.global_position
			$custSelect.scale=Vector2(2,2)
		
	if(Input.is_action_just_pressed("Pshot")):
		if(select== Vector2(6,0)):
			$".".visible=false
			get_tree().paused=false
			
